package com.amazon.atlas22.railwayCrossingApp.Controller;

import com.amazon.atlas22.railwayCrossingApp.db.DB;
import com.amazon.atlas22.railwayCrossingApp.model.RailwayCrossing;
import com.amazon.atlas22.railwayCrossingApp.model.User;

import java.util.Map;

public class RailwayCrossingController {
    //Responsibilities : 1.login,2.add/update crossing 3.delete crossing 4. fetch crossing 5. get count of crossing
    // 6. Import/Export data.

    private static RailwayCrossingController controller;
    private RailwayCrossingController(){

    }
    public static RailwayCrossingController getInstance(){
        if(controller==null)
        {
            controller= new RailwayCrossingController();
        }
        return controller;
    }

    private DB db = DB.getInstance();

    public boolean loginUser(User user)
    {
        if(user.validate())
        {
            User retrievedUser = (User) db.retrieve(user.getEmail());
            if(retrievedUser!=null && retrievedUser.getUserType()==2){
                user.setName(retrievedUser.getName());
                return retrievedUser.getEmail().equalsIgnoreCase(user.getEmail()) &&
                        retrievedUser.getPassword().equalsIgnoreCase(user.getPassword());
            }

        }
        return false;
    }

    public boolean addOrUpdateCrossing(RailwayCrossing crossing)
    {
        return  db.set(crossing);
    }

    public boolean deleteCrossing(RailwayCrossing crossing) {
        return db.delete(crossing);
    }

    public static void searchCrossing(String crossingName)
    {
        Map<String, RailwayCrossing> crossings = (Map<String,RailwayCrossing>) controller.fetchCrossings();
        for(String key:crossings.keySet())
        {
            if(crossings.get(key).getName().equalsIgnoreCase(crossingName)) {
                System.out.println(crossings.get(key));
                break;
            }
        }

    }
    public Map<String, ?> fetchCrossings() {
        return db.retrieve(new RailwayCrossing());
    }

    public int getCrossingsCount() {
        return db.getCrossingsCount();
    }

    public void exportData() {
        db.exportData();
    }
    public void importData() {
        db.importData();
    }
}
