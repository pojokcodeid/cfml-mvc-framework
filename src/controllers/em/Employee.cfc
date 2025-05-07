
component extends="core.BaseController" {
    
    public function init() {
        return this;
    }

    public struct function sayHay(id){
        var emp= new models.Employee();
        return emp.sayHay(id);
    }

    public any function getAll(){
        var emp = model("em.Employee");
        var content = emp.getAllData();
        view("emp.index", content);
    }

    public any function addNew(){
        view("emp.add");
    }

    public any function getById(id){
        var emp = model("em.Employee");
        // return emp.getById(id);
        local.content= emp.getById(id);
        view("emp.index", local.content);
    }

    public any function createData(content={}){
        var emp= model("em.Employee");
        local.content = emp.createData(content);
        getAll();
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