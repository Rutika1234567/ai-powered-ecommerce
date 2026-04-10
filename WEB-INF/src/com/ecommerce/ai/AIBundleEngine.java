package com.ecommerce.ai;

import java.util.*;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

public class AIBundleEngine {

    public static AIRecommendation generateBundle(String query){

        ProductDAO dao = new ProductDAO();

        double budget = AIIntentParser.detectBudget(query);
        String occasion = AIIntentParser.detectOccasion(query);

        // ✅ Fetch only relevant categories
        List<Product> products = new ArrayList<>();

        products.addAll(dao.getProductsByCategory("Fashion"));
        products.addAll(dao.getProductsByCategory("Footwear"));
        products.addAll(dao.getProductsByCategory("Bags"));
        products.addAll(dao.getProductsByCategory("Jewellery"));
        products.addAll(dao.getProductsByCategory("Kurti / Saree"));

        // ✅ FINAL BUNDLE
        List<Product> bundle = new ArrayList<>();
        double total = 0;

        // ✅ Separate items (IMPORTANT FIX)
        Product fashion = null;
        Product footwear = null;
        Product accessory = null;

        for(Product p : products){

            if(p.getPrice() > budget) continue;

            if(p.getTags() == null || 
               !p.getTags().toLowerCase().contains(occasion)) continue;

            // ✅ Fashion or Kurti
            if(fashion == null && 
               (p.getCategory().equalsIgnoreCase("Fashion") || 
                p.getCategory().equalsIgnoreCase("Kurti / Saree"))) {

                fashion = p;
            }

            // ✅ Footwear
            else if(footwear == null && 
                    p.getCategory().equalsIgnoreCase("Footwear")) {

                footwear = p;
            }

            // ✅ Accessories
            else if(accessory == null && 
                   (p.getCategory().equalsIgnoreCase("Bags") || 
                    p.getCategory().equalsIgnoreCase("Jewellery"))) {

                accessory = p;
            }
        }

        // ✅ Build final bundle
        if(fashion != null){
            bundle.add(fashion);
            total += fashion.getPrice();
        }

        if(footwear != null){
            bundle.add(footwear);
            total += footwear.getPrice();
        }

        if(accessory != null){
            bundle.add(accessory);
            total += accessory.getPrice();
        }

        //  REMOVED WRONG FALLBACK (important)

        AIRecommendation rec = new AIRecommendation();
        rec.setProducts(bundle);
        rec.setTotalPrice(total);
        rec.setDiscount(total * 0.1);

        return rec;
    }
}