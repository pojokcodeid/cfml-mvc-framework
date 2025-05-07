component{
    
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
        return { 
            code: 200,
			success=true,
			message="Get Data By Id Success", 
            key=id,
			data= {
                name="Pojok Code"
            }
		};
    }

    public struct function createData(content){
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
            var message = new core.Message();
            message.flash("success", "Crate Data Success");
            return { 
                code: 201,
                success=true,
                message="Crate Data Success", 
                data= {}
            };
        } catch (any e) {
            return { 
                code: 400,
                success=false,
                message="Crate Data Failed", 
                data= {}
            };
        }
    }

    public struct function updateData(id){
        return { 
            code: 200,
			success=true,
			message="Update Data Success", 
            key=id,
			data= {
                name="Pojok Code"
            }
		};
    }

    public struct function deleteData(id){
        return { 
            code: 200,
			success=true,
			message="Delete Data Success", 
            key=id,
			data= {
                name="Pojok Code"
            }
		};
    }
}