// This file stores critical functions required for entire app
//
function convertHeightToMeters(height, heightUnit){
       if(heightUnit == 'inches'){ height = height*0.0254 }
       if(heightUnit == 'cm'    ){ height = height*0.01   }
       if(heightUnit == 'meters'){ height = height }
       return height
}
function convertWeightToKg(weight, weightUnit){
       if(weightUnit == 'Lb'){weight    = weight*0.453592}
       if(weightUnit == 'grams'){weight = weight}
       return weight
}
