<cfoutput>
    <div class="container">
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
                <cfloop array="#data#" index="i">
                    <tr>
                        <th scope="row">1</th>
                        <td>#i.name#</td>
                        <td>#i.email#</td>
                        <td>#i.age#</td>
                    </tr>
                </cfloop>   
            </tbody>
        </table>
    </div>
</cfoutput>