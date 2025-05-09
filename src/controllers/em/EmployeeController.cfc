
component extends="core.BaseController" {

    variables.emp = model("em.EmployeeModel");
    variables.rules = {
        // name  : "required|strong_password|min:3|max:20",
        name  : "required|min:3|max:20",
        email : "required|is_email|max:50",
        age: "required|is_numeric"
    }
    
    public function init() {
        return this;
    }


    public any function getAll(){
        var content=[];
        try{
            content = emp.getAllData();
        }catch (any exName) {
            flash("danger", exName.message);
        }
        view("emp.index", {
            data: content
        });
    }

    public any function addNew(){
        view("emp.add");
    }

    public any function getById(id){
        var content={};
        try{
            content= emp.getById(id);
        }catch (any exName) {
            flash("danger", exName.message);
        }
        view("emp.edit", {
            data: content
        });
    }

    public any function createData(content={}){
        if (structKeyExists(content, "lampiran")) { 
            // Ambil informasi file upload
            fileField = "lampiran";
            uploadDir = expandPath("/public/uploads/");
          
            // Buat folder jika belum ada
            if (!directoryExists(uploadDir)) {
              directoryCreate(uploadDir);
            }
          
            // Upload dan rename
            uploadedFile = fileUpload(
                destination = uploadDir, 
                fileField = fileField, 
                mode = "makeunique"
            );
            // Ambil ekstensi file original
            fileExt = listLast(uploadedFile.serverFile, ".");
          
            // Generate nama UUID
            uuidName = createUUID() & "." & fileExt;
          
            
            // Rename file ke UUID
            fileMove(
              source = uploadedFile.serverDirectory & "/" & uploadedFile.serverFile,
              destination = uploadDir & uuidName
            );

        }
        var result = validate(content, rules);
        var retdata = {
            name: content.name,
            email: content.email,
            age: content.age
        };
        if(result.success){
            try{
                emp.createData(content);
                flash("success", "Create Data Success");
                redirect("/employee");
            }catch (any exName) {
                flash("danger", exName.message, retdata);
                redirect("/employee/add");
            }
        }else{
            flash("danger", result.errors[1], retdata);
            redirect("/employee/add");
        }
    }

    public any function updateData(id, content={}){
        var result = validate(content, rules);
        var retData = {
            id: id,
            name: content.name,
            email: content.email,
            age: content.age
        };
        if(result.success){
            try{
                content.id = id;
                emp.updateData(content);
                flash("success", "Update Data Success");
                redirect("/employee");
            }catch (any exName) {
                flash("danger", exName.message, retData);
                redirect("/employee/edit/" & id);
            }
        }else{
            flash("danger", result.errors[1], retData);
            redirect("/employee/edit/" & id);
        }
    }
    public struct function deleteData(id){
        try{
            var result = emp.deleteData(id);
            if(result.id != 0){        
                flash("success", "Delete Data Success");
                redirect("/employee");
            }else{
                flash("danger", "Delete Data Failed");
                redirect("/employee");
            }
        }catch (any exName) {
            flash("danger", exName.message);
            redirect("/employee");
        }
    }
    
}