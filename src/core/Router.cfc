component {

    function begin() {
        app = new core.App();
        app.setDefaultController("Default");
        app.setDefaultControllerMethod("index");
        app.get("/employee/say-hay", { controller: "em.Employee", method: "sayHay"});
        app.get("/employee", { controller: "em.Employee", method: "getAll"});
        app.get("/employee/add", { controller: "em.Employee", method: "addNew"});
        app.get("/employee/edit/:id", { controller: "em.Employee", method: "getById"});
        app.post("/employee/edit/:id", { controller: "em.Employee", method: "updateData"});
        app.post("/employee", { controller: "em.Employee", method: "createData"});
        app.get("/employee/delete/:id", { controller: "em.Employee", method: "deleteData"});
        return app.run();
    }
}
