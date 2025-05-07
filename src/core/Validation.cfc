component {

    public struct function validate(required struct data, required struct rules) {
      var errors = [];
  
      for (var field in rules) {
        var ruleSet = listToArray(rules[field], "|");
        var value = data[field];
  
        for (var rule in ruleSet) {
          var valid = true;
  
          switch (rule) {
            case "required":
              valid = structKeyExists(data, field) && len(trim(value)) > 0;
              if (!valid) arrayAppend(errors, "#field# is required.");
              break;
  
            case "is_email":
              valid = isValid("email", value);
              if (!valid) arrayAppend(errors, "#field# must be a valid email.");
              break;
  
            case "is_numeric":
              valid = isNumeric(value);
              if (!valid) arrayAppend(errors, "#field# must be numeric.");
              break;
  
            // 🔄 Extend here for more rules:
            default:
              // Skip unknown rules
          }
  
          if (!valid) break; // Stop further rules on first failure
        }
      }
  
      return {
        success = arrayLen(errors) == 0,
        errors  = errors
      };
    }
  
}
  