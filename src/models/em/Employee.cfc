component extends="core.Message" {
    
    public function init() {
        return this;
    }
    
    public struct function sayHay(id){
        return { 
            code: 200,
			success=true,
			message="Get Data Success", 
            key=id,
			data= {
                name="Pojok Code"
            }
		};
    }
    public struct function getAllData(){
        local.personals = [];
        local.qPersonal = queryExecute(
            "SELECT id, name, email, age FROM personal"
        );
        for (var p in local.qPersonal) {
            arrayAppend(local.personals, {
                id = p.id,
                name = p.name,
                email = p.email,
                age = p.age
            });
        }
        return { 
            code: 200,
			success=true,
			message="Get All Data Success", 
			data= local.personals
		};
    }

    public struct function getById(id){
        local.qPersonal = queryExecute(
            "SELECT id, name, email, age FROM personal WHERE id = ?",
            [id]
        );
        if (local.qPersonal.recordCount) {
            return { 
                code: 200,
                success=true,
                message="Get Data Success", 
                data= {
                    id = local.qPersonal.id,
                    name = local.qPersonal.name,
                    email = local.qPersonal.email,
                    age = local.qPersonal.age
                }
            };
        }
        return { 
            code: 404,
			success=false,
			message="data not found", 
			data= {}
		};
    }

    public void function createData(content){
        local.dataToInsert = {
            name = {value=content.name, sqltype="CF_SQL_VARCHAR"},
            email = {value=content.email, sqltype="CF_SQL_VARCHAR"},
            age = {value=content.age, sqltype="CF_SQL_INTEGER"}
        };
        try{
            local.qInsert = queryExecute(
                "INSERT INTO personal (name, email, age) VALUES (:name, :email, :age)",
                local.dataToInsert
            );
            flash("success", "Crate Data Success");
        } catch (any e) {
            flash("danger", "Crate Data Failed");
        }
    }

    public void function updateData(content){
        local.dataToUpdate = {
            id = {value=content.id, sqltype="CF_SQL_INTEGER"},
            name = {value=content.name, sqltype="CF_SQL_VARCHAR"},
            email = {value=content.email, sqltype="CF_SQL_VARCHAR"},
            age = {value=content.age, sqltype="CF_SQL_INTEGER"}
        };
        var message = new core.Message();
        try{
            local.qUpdate = queryExecute(
                "UPDATE personal SET name = :name, email = :email, age = :age WHERE id = :id",
                local.dataToUpdate
            );
            flash("success", "Update Data Success");
        } catch (any e) {
            flash("danger", "Update Data Failed");
        }
    }

    public void function deleteData(id){
        try{
            local.qDelete = queryExecute(
                "DELETE FROM personal WHERE id = ?",
                [id]
            );
            flash("success", "Delete Data Success");
        } catch (any e) {
            flash("danger", "Delete Data Failed");
        }
    }
}