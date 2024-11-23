import Procedure from '../models/procedure-model.js';

export default class ProcedureController {
    // POST
    static async addProcedure(req, res) {
        const data = req.body;
        try {
            const newProcedureId = await Procedure.createProcedure(data);
            if(!newProcedureId) {
                throw new Error('Error creating procedure');
            } else if (newProcedureId) {
                console.log('Procedure created successfully from controller:', newProcedureId);
                return res.status(201).json({ message: 'Procedure created successfully from controller', newProcedureId});
            }
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async getAllProcedures(req, res) {
        try {
            const allProcedures = await Procedure.getAllProcedures();
            if(!allProcedures) {
                throw new Error('Error fetching all procedures');
            } else if (allProcedures) {
                console.log('All procedures fetched successfully from controller:', allProcedures);
                return res.status(200).json({ message: 'All procedures fetched successfully from controller', allProcedures});
            }
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateProcedure(req, res) {
        const data = req.body;
        try {
            await Procedure.updProcedure(data);
            console.log('Procedure updated successfully from controller:', data);
            return res.status(200).json({ message: 'Procedure updated successfully from controller', data});
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async deleteProcedure(req, res) {
        const prcd_id = req.params.id;
        try {
            await Procedure.delProcedure(prcd_id);
            console.log('Procedure deleted successfully from controller:', prcd_id);
            return res.status(200).json({ message: 'Procedure deleted successfully from controller', prcd_id});
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}