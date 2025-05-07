<cfoutput>
    <div class="container mt-5">
        <h3>Add Employee</h3>
        <form class="mt-4" action="#application.baseURL#/employee" method="post">
            <div class="mb-3 row">
                <label for="name" class="col-sm-2 col-form-label">Name</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="name" id="name">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-5">
                  <input type="email" class="form-control" name="email" id="email">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="age" class="col-sm-2 col-form-label">Age</label>
                <div class="col-sm-3">
                  <input type="number" class="form-control" name="age" id="age">
                </div>
            </div>
            <div class="mb-3 row">
                <div for="age" class="col-sm-2"></div>
                <div class="col-sm-3">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </div>
        </form>
    </div>
</cfoutput>