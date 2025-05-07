<cfoutput>
    <div class="container mt-5">
        <a href="#application.baseURL#/employee/add" class="btn btn-primary btn-sm">Add New</a>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">##</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Age</th>
                </tr>
            </thead>
            <tbody>
                <cfset no = 0>
                <cfloop array="#data#" index="i">
                    <cfset no = no + 1>
                    <tr>
                        <th scope="row">#no#</th>
                        <td>#i.name#</td>
                        <td>#i.email#</td>
                        <td>#i.age#</td>
                    </tr>
                </cfloop>   
            </tbody>
        </table>
    </div>
</cfoutput>