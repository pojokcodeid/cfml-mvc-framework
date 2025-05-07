component {

    public struct function flash(type, message) {
        session.flash = {
            type=type,
            message=message
        };
        return true;
    }

    public struct function getFlash() {
        var flash = structNew();
        if (structKeyExists(session, "flash")) {
            flash = duplicate(session.flash);
            structDelete(session, "flash");
        }
        return flash;
    }

}
