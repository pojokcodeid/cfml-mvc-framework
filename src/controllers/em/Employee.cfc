
component extends="core.BaseController" {

    variables.emp = model("em.Employee");
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
        var content = emp.getAllData();
        view("emp.index", content);
    }

    public any function addNew(){
        view("emp.add");
    }

    public any function getById(id){
        local.content= emp.getById(id);
        view("emp.edit", local.content);
    }

    public any function createData(content={}){
        var result = validate(content, rules);
        if(result.success){
            local.content = emp.createData(content);
            redirect("/employee");
        }else{
            flash("danger", result.errors[1],{
                name: content.name,
                email: content.email,
                age: content.age
            });
            redirect("/employee/add");
        }
    }

    public any function updateData(id, content={}){
        var result = validate(content, rules);
        if(result.success){
            content.id = id;
            emp.updateData(content);
            redirect("/employee");
        }else{
            flash("danger", result.errors[1],{
                id: id,
                name: content.name,
                email: content.email,
                age: content.age
            });
            redirect("/employee/edit/" & id);
        }
    }
    public struct function deleteData(id){
        emp.deleteData(id);
        redirect("/employee");
    }
    
}