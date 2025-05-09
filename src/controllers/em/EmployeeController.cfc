
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

    private void function uploadAttach(content={}){
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
            content.lampiran = uuidName;
            
            // Rename file ke UUID
            fileMove(
              source = uploadedFile.serverDirectory & "/" & uploadedFile.serverFile,
              destination = uploadDir & uuidName
            );

        }
    }

    public any function createData(content={}){
        var uuidName = "";
        uploadAttach(content);
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
        // writeDump(var=content, label="content");
        // abort;
        var result = validate(content, rules);
        var retData = {
            id: id,
            name: content.name,
            email: content.email,
            age: content.age,
            attachment: content.lampiran
        };
        if(result.success){
            try{
                content.id = id;
                // check data exists 
                var data = emp.getById(id);
                if (not structKeyExists(data, "id")) { 
                    flash("danger", "Data Not Found");
                    redirect("/employee");
                }
                // cek apakah lampiran ada isinya
                if (structKeyExists(content, "lampiran") && len(trim(content.lampiran)) > 0) {
                    // hapus file lama
                    if (structKeyExists(data, "attachment")) {
                        var fileToDelete = expandPath("/public/uploads/") & data.attachment;
                        if (fileExists(fileToDelete)) {
                            fileDelete(fileToDelete);
                        }
                    }
                    // upload file baru
                    uploadAttach(content);
                }
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