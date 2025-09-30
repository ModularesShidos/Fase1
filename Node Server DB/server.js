const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const cors = require('cors');

const app = express();

// 🔥 CONFIGURACIÓN SUPER SIMPLE PARA GAMEMAKER
app.use(cors({ origin: '*' })); // Solo esto, nada más
app.use(express.json());
app.use((req, res, next) => {
    console.log("🌐 Petición recibida:", {
        method: req.method,
        url: req.url,
        headers: req.headers,
        body: req.body
    });
    next();
});

const db = new sqlite3.Database('./saves.db', (err) => {
    if (err) console.error("Error abriendo BD:", err);
});

// Crear tablas si no existen (tu código igual)
db.serialize(() => {
    db.run(`CREATE TABLE IF NOT EXISTS Progreso (
        id_partida INTEGER PRIMARY KEY,
        fecha_guardado DATETIME DEFAULT CURRENT_TIMESTAMP,
        game_state INTEGER DEFAULT 0,
        dialogo_activo INTEGER DEFAULT 0,
        dialogo_cerrado INTEGER DEFAULT 0,
        class_state INTEGER DEFAULT 0,
        mision_terminada INTEGER DEFAULT 0,
        fuentes_cont INTEGER DEFAULT 0,
        dialogo_id INTEGER DEFAULT 0,
        textbox_visto INTEGER DEFAULT 0,
        is_class INTEGER DEFAULT 0,
        is_contra INTEGER DEFAULT 0,
        pared_vista INTERGER DEFAULT 0,
        mission_clear_aux INTEGER DEFAULT 0,
        pared_dialogo_mostrado INTEGER DEFAULT 0,
        textbox_cerrado_manualmente INTEGER DEFAULT 0 
    )`);

    db.run(`CREATE TABLE IF NOT EXISTS NPCs (
        id_partida INTEGER,
        npc_id INTEGER,
        ya_hablo INTEGER DEFAULT 0
    )`);

    db.run(`CREATE TABLE IF NOT EXISTS Inventario (
        id_partida INTEGER,
        item_id INTEGER,
        cantidad INTEGER DEFAULT 0
    )`);

    db.run(`CREATE TABLE IF NOT EXISTS Clases (
        id_partida INTEGER,
        clase_id INTEGER,
        completada INTEGER DEFAULT 0
    )`);
});

// Helper: guardar NPCs, inventario y clases - VERSIÓN MEJORADA
function guardarDatosPartida(id_partida, npcs = [], inventario = [], clases = [], res, esActualizacion) {
    db.serialize(() => {
        db.run('DELETE FROM NPCs WHERE id_partida = ?', [id_partida]);
        db.run('DELETE FROM Inventario WHERE id_partida = ?', [id_partida]);
        db.run('DELETE FROM Clases WHERE id_partida = ?', [id_partida]);

        const stmtNpc = db.prepare('INSERT INTO NPCs (id_partida, npc_id, ya_hablo) VALUES (?, ?, ?)');
        npcs.forEach(npc => stmtNpc.run(id_partida, npc.id, npc.ya_hablo));
        stmtNpc.finalize();

        const stmtInv = db.prepare('INSERT INTO Inventario (id_partida, item_id, cantidad) VALUES (?, ?, ?)');
        inventario.forEach(it => stmtInv.run(id_partida, it.id, it.cantidad));
        stmtInv.finalize();

        const stmtCls = db.prepare('INSERT INTO Clases (id_partida, clase_id, completada) VALUES (?, ?, ?)');
        clases.forEach(c => stmtCls.run(id_partida, c.id, c.completada));
        stmtCls.finalize(err => {
            if (err) {
                console.error("❌ Error finalizando guardado:", err);
                return res.status(500).json({ error: err.message });
            }
            
            // 🔥 RESPUESTA MEJORADA PARA GAMEMAKER
            console.log("✅ Guardado completado para ID:", id_partida);
            
            const respuesta = {
                id_partida: id_partida,
                message: esActualizacion ? 'Partida actualizada' : 'Nueva partida creada',
                success: true,
                timestamp: new Date().toISOString(),
                detalles: {
                    npcs_guardados: npcs.length,
                    items_guardados: inventario.length,
                    clases_guardadas: clases.length
                }
            };
            
            // ENVIAR RESPUESTA CON ENCABEZADOS 
            res.writeHead(200, {
                'Content-Type': 'application/json; charset=utf-8',
                'Access-Control-Allow-Origin': '*',
                'Connection': 'close'
            });
            
            res.end(JSON.stringify(respuesta));
        });
    });
}

// Helper: actualizar tablas con UPDATE
function actualizarDatosPartida(id_partida, npcs = [], inventario = [], clases = [], res) {
    db.serialize(() => {
        // Actualizar NPCs
        npcs.forEach(npc => {
            db.run(
                `UPDATE NPCs SET ya_hablo = ? WHERE id_partida = ? AND npc_id = ?`,
                [npc.ya_hablo, id_partida, npc.id]
            );
        });

        // Actualizar Inventario
        inventario.forEach(item => {
            db.run(
                `UPDATE Inventario SET cantidad = ? WHERE id_partida = ? AND item_id = ?`,
                [item.cantidad, id_partida, item.id]
            );
        });

        // Actualizar Clases
        clases.forEach(clase => {
            db.run(
                `UPDATE Clases SET completada = ? WHERE id_partida = ? AND clase_id = ?`,
                [clase.completada, id_partida, clase.id]
            );
        });

        res.json({ success: true, message: "Partida actualizada correctamente", id_partida });
    });
}


// GET VERIFICAR EXISTENCIA DE PARTIDA
app.get('/api/partida/existe/:idPartida', (req, res) => {
    const id_partida = parseInt(req.params.idPartida);

    if (id_partida < 1 || id_partida > 3) {
        return res.status(400).json({ error: "Slot inválido" });
    }

    db.get('SELECT 1 FROM Progreso WHERE id_partida = ?', [id_partida], (err, row) => {
        if (err) {
            console.error("❌ Error verificando existencia:", err);
            return res.status(500).json({ error: err.message });
        }

        res.json({
            id_partida: id_partida,
            existe: !!row // true si existe, false si no
        });
    });
});

// 🔥 POST GUARDAR - VERSIÓN SIMPLIFICADA
app.post('/api/partida/guardar', (req, res) => {
    console.log("📥 Recibiendo guardado. ID recibido:", req.body.id_partida);

    // 🔥 CONFIGURACIÓN ESPECÍFICA PARA GAMEMAKER
    res.header('Content-Type', 'application/json; charset=utf-8');
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'POST');
    
    const { progreso = {}, npcs = [], inventario = [], clases = [], id_partida } = req.body;

    // 🔥 FORZAR ID VÁLIDO (1, 2 o 3)
    const slotId = Math.max(1, Math.min(3, parseInt(id_partida) || 1));
    console.log("💾 Guardando en slot:", slotId);

    // Verificar si ya existe partida en ese slot
    db.get('SELECT * FROM Progreso WHERE id_partida = ?', [slotId], (err, row) => {
        if (err) {
            console.error("❌ Error verificando slot:", err);
            return res.status(500).json({ error: err.message });
        }
        
        if (row) {
            // 🔥 ACTUALIZAR PARTIDA EXISTENTE
            console.log("🔄 Actualizando partida existente en slot:", slotId);
            db.run(
                `UPDATE Progreso SET game_state=?, dialogo_activo=?, dialogo_cerrado=?, class_state=?, mision_terminada=?, fuentes_cont=?, dialogo_id=?, textbox_visto=?, is_class=?, pared_vista = ?, is_contra=?, mission_clear_aux=?, pared_dialogo_mostrado=?, textbox_cerrado_manualmente = ?, fecha_guardado=CURRENT_TIMESTAMP WHERE id_partida = ?`,
                [
                    progreso.game_state || 0, progreso.dialogo_activo || 0, progreso.dialogo_cerrado || 0,
                    progreso.class_state || 0, progreso.mision_terminada || 0,
                    progreso.fuentes_cont || 0, progreso.dialogo_id || 0, progreso.textbox_visto || 0,
                    progreso.is_class || 0,  progreso.pared_vista || 0, progreso.is_contra || 0,
                    progreso.mission_clear_aux || 0, progreso.pared_dialogo_mostrado || 0,
                    progreso.textbox_cerrado_manualmente || 0, slotId
                ],
                function(err) {
                    if (err) {
                        console.error("❌ Error actualizando:", err);
                        return res.status(500).json({ error: err.message });
                    }
                    console.log("✅ Partida actualizada en slot:", slotId);
                    guardarDatosPartida(slotId, npcs, inventario, clases, res, true);
                }
            );
        } else {
            // 🔥 CREAR NUEVA PARTIDA CON ID FIJO
            console.log("🆕 Creando nueva partida en slot:", slotId);
            db.run(
                `INSERT INTO Progreso (id_partida, game_state, dialogo_activo, dialogo_cerrado, class_state, mision_terminada, fuentes_cont, dialogo_id, textbox_visto, is_class, pared_vista, is_contra, mission_clear_aux, pared_dialogo_mostrado, textbox_cerrado_manualmente)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [
                    slotId, // 🔥 ID FIJO (no autoincremental)
                    progreso.game_state || 0, progreso.dialogo_activo || 0, progreso.dialogo_cerrado || 0,
                    progreso.class_state || 0, progreso.mision_terminada || 0,
                    progreso.fuentes_cont || 0, progreso.dialogo_id || 0, progreso.textbox_visto || 0,
                    progreso.is_class || 0, progreso.pared_vista || 0, progreso.is_contra || 0, 
                    progreso.mission_clear_aux || 0, progreso.pared_dialogo_mostrado || 0,
                    progreso.textbox_cerrado_manualmente || 0
                ],
                function(err) {
                    if (err) {
                        console.error("❌ Error insertando:", err);
                        return res.status(500).json({ error: err.message });
                    }
                    console.log("✅ Nueva partida creada en slot:", slotId);
                    guardarDatosPartida(slotId, npcs, inventario, clases, res, false);
                }
            );
        }
    });
});

// 🔥 PUT ACTUALIZAR PARTIDA - VERSIÓN CORREGIDA
app.put('/api/partida/actualizar/:idPartida', (req, res) => {
    const id_partida = parseInt(req.params.idPartida);
    const { progreso = {}, npcs = [], inventario = [], clases = [] } = req.body;

    if (!id_partida || id_partida < 1 || id_partida > 3) {
        return res.status(400).json({ error: "ID de partida inválido" });
    }

    // Actualizar la tabla Progreso
    db.run(
        `UPDATE Progreso SET
            game_state = ?,
            dialogo_activo = ?,
            dialogo_cerrado = ?,
            class_state = ?,
            mision_terminada = ?,
            fuentes_cont = ?,
            dialogo_id = ?,
            textbox_visto = ?,
            is_class = ?,
            pared_vista = ?,
            is_contra = ?,
            mission_clear_aux = ?,
            pared_dialogo_mostrado = ?,
            textbox_cerrado_manualmente = ?,
            fecha_guardado = CURRENT_TIMESTAMP
         WHERE id_partida = ?`,
        [
            progreso.game_state || 0,
            progreso.dialogo_activo || 0,        // ✅ AGREGAR
            progreso.dialogo_cerrado || 0,       // ✅ AGREGAR  
            progreso.class_state || 0,
            progreso.mision_terminada || 0,
            progreso.fuentes_cont || 0,
            progreso.dialogo_id || 0,
            progreso.textbox_visto || 0,
            progreso.is_class || 0,
            progreso.pared_vista || 0,           // ✅ AGREGAR
            progreso.is_contra || 0,
            progreso.mission_clear_aux || 0,
            progreso.pared_dialogo_mostrado || 0,
            progreso.textbox_cerrado_manualmente || 0,
            id_partida
        ],
        function(err) {
            if (err) {
                console.error("❌ Error actualizando partida:", err);
                return res.status(500).json({ error: err.message });
            }

            // ✅ CORREGIDO: Guardar también NPCs, inventario y clases
            actualizarDatosPartida(id_partida, npcs, inventario, clases, res, true);
        }
    );
});

// 🔥 GET CARGAR - VERSIÓN SIMPLIFICADA
// 🔥 GET CARGAR - VERSIÓN CORREGIDA (agrega id_partida)
app.get('/api/partida/cargar/:idPartida', (req, res) => {
    const id_partida = parseInt(req.params.idPartida);
    
    // 🔥 VALIDAR SLOT
    if (id_partida < 1 || id_partida > 3) {
        return res.status(400).json({ error: 'Slot inválido' });
    }
    
    db.get('SELECT * FROM Progreso WHERE id_partida = ?', [id_partida], (err, progreso) => {
        if (err) return res.status(500).json({ error: err.message });
        if (!progreso) return res.status(404).json({ 
            message: 'No hay partidas guardadas',
            existe: false,
            slot: id_partida
        });

        // Obtener todos los datos en paralelo
        Promise.all([
            new Promise(resolve => db.all('SELECT * FROM NPCs WHERE id_partida = ?', [id_partida], (err, rows) => resolve(rows))),
            new Promise(resolve => db.all('SELECT * FROM Inventario WHERE id_partida = ?', [id_partida], (err, rows) => resolve(rows))),
            new Promise(resolve => db.all('SELECT * FROM Clases WHERE id_partida = ?', [id_partida], (err, rows) => resolve(rows)))
        ]).then(([npcs, inventario, clases]) => {
            // 🔥 RESPUESTA CORREGIDA - INCLUYE id_partida Y existe
            res.json({
                id_partida: id_partida,  // 🔥 NUEVO
                existe: true,            // 🔥 NUEVO
                slot: id_partida,        // 🔥 NUEVO
                progreso: {
                    game_state: progreso.game_state,
                    dialogo_activo: progreso.dialogo_activo,
                    dialogo_cerrado: progreso.dialogo_cerrado,
                    class_state: progreso.class_state,
                    mision_terminada: progreso.mision_terminada,
                    fuentes_cont: progreso.fuentes_cont,
                    dialogo_id: progreso.dialogo_id,
                    textbox_visto: progreso.textbox_visto,
                    is_class: progreso.is_class,
                    pared_vista: progreso.pared_vista,
                    is_contra: progreso.is_contra,
                    mission_clear_aux: progreso.mission_clear_aux,
                    pared_dialogo_mostrado: progreso.pared_dialogo_mostrado,
                    textbox_cerrado_manualmente: progreso.textbox_cerrado_manualmente
                },
                npcs: npcs,
                inventario: inventario,
                clases: clases
            });
        });
    });
});

// 🔥 LISTAR PARTIDAS
// 🔥 GET PARA VER TODOS LOS SLOTS (NUEVO ENDPOINT)
app.get('/api/partidas', (req, res) => {
    console.log("📋 Solicitando lista de partidas...");
    
    db.all('SELECT id_partida, fecha_guardado, game_state FROM Progreso ORDER BY id_partida', (err, partidas) => {
        if (err) {
            console.error("❌ Error obteniendo partidas:", err);
            return res.status(500).json({ error: err.message });
        }
        
        console.log("✅ Partidas en BD:", partidas);
        
        // Crear respuesta con información de los 3 slots
        const respuesta = {
            total: partidas.length,
            partidas: partidas, // Las que realmente existen en BD
            slots: {
                1: partidas.find(p => p.id_partida === 1) || { existe: false },
                2: partidas.find(p => p.id_partida === 2) || { existe: false },
                3: partidas.find(p => p.id_partida === 3) || { existe: false }
            }
        };
        
        res.json(respuesta);
    });
});

// 🔥 DELETE PARTIDA
app.delete('/api/partida/:idPartida', (req, res) => {
    const id_partida = parseInt(req.params.idPartida);

    if (!id_partida || id_partida < 1 || id_partida > 3) {
        return res.status(400).json({ error: "ID de partida inválido" });
    }

    db.serialize(() => {
        // 🔹 Borrar todo de las 4 tablas
        db.run('DELETE FROM Progreso WHERE id_partida = ?', [id_partida]);
        db.run('DELETE FROM NPCs WHERE id_partida = ?', [id_partida]);
        db.run('DELETE FROM Inventario WHERE id_partida = ?', [id_partida]);
        db.run('DELETE FROM Clases WHERE id_partida = ?', [id_partida], function(err) {
            if (err) {
                console.error("❌ Error eliminando partida:", err);
                return res.status(500).json({ error: err.message });
            }
            
            console.log(`🗑️ Partida ${id_partida} eliminada de todas las tablas`);
            res.json({
                success: true,
                message: `Partida ${id_partida} eliminada correctamente`
            });
        });
    });
});
// 🔥 INICIAR SERVIDOR EN TODAS LAS INTERFACES
app.listen(3000, '0.0.0.0', () => {
    console.log('🚀 Servidor listo para GameMaker');
});