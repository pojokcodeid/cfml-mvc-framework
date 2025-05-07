
component extends="core.BaseController" {
    
    public function init() {
        return this;
    }

    public struct function sayHay(id){
        var emp= new models.Employee();
        return emp.sayHay(id);
    }

    public struct function getAll(){
        var emp= new models.Employee();
        return emp.getAllData();
    }

    public any function getById(id){
        // var emp= new models.Employee();
        // return emp.getById(id);
        var emp = model("em.Employee");
        local.content= emp.getById(id);
        view("emp.index", local.content);
    }

    public struct function createData(content={}){
        var emp= new models.Employee();
        return emp.createData(content);
    }

    public struct function updateData(id){
        var emp= new models.Employee();
        return emp.updateData(id);
    }
    public struct function deleteData(id){
        var emp= new models.Employee();
        return emp.deleteData(id);
    }
    
}