
package com.ecommerce.ai;

public class AIIntentParser {

public static String detectOccasion(String query){

    query = query.toLowerCase();

    if(query.contains("beach"))
        return "beach";

    if(query.contains("wedding"))
        return "wedding";

    if(query.contains("party"))
        return "party";

    if(query.contains("office"))
        return "formal";

    return "casual"; // default
}
/* THIS METHOD WAS MISSING */

public static double detectBudget(String query){

query = query.toLowerCase();

String numbers = query.replaceAll("[^0-9]", " ").trim();

if(numbers.isEmpty())
return 999999; // no budget mentioned

String[] parts = numbers.split("\\s+");

return Double.parseDouble(parts[0]);

}


public static String detectCategory(String query){

    query = query.toLowerCase();

    if(query.contains("mobile") || query.contains("phone"))
        return "Mobiles";

    if(query.contains("dress") || query.contains("outfit") || query.contains("fashion"))
        return "Fashion";

    if(query.contains("tv") || query.contains("electronics"))
        return "Electronics";

    if(query.contains("furniture") || query.contains("home"))
        return "Home";

    return "Fashion";
}

}