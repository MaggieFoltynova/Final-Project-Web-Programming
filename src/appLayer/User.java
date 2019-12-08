package appLayer;

public class User {
    public boolean isValidUserCredentials(String isUsername, String isUserPassword){
        if(isUsername.equals("magda") && isUserPassword.equals("12345")){
            return true;
        }
        return false;
    }
}
