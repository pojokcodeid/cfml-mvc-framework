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
        return { 
            code: 201,
			success=true,
			message="Crate Data Success", 
			data= content
		};
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