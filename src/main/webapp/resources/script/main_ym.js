jQuery(document).ready(function ($) {

var jssor_1_options = {
	  $AutoPlay: true,
	  $AutoPlaySteps: 5,
	  $SlideDuration: 160,
	  $SlideWidth: 130,
	  $SlideSpacing: 30,
	  $Cols: 4,
	  $ArrowNavigatorOptions: {
	    $Class: $JssorArrowNavigator$,
	    $Steps: 5
	  },
	  $BulletNavigatorOptions: {
	    $Class: $JssorBulletNavigator$,
	    $SpacingX: 1,
	    $SpacingY: 1
	  }
};

var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
//
var jssor_2_options = {
        $AutoPlay: true,
        $AutoPlaySteps: 5,
        $SlideDuration: 160,
        $SlideWidth: 130,
        $SlideSpacing: 30,
        $Cols: 4,
        $ArrowNavigatorOptions: {
          $Class: $JssorArrowNavigator$,
          $Steps: 5
        },
        $BulletNavigatorOptions: {
          $Class: $JssorBulletNavigator$,
          $SpacingX: 1,
          $SpacingY: 1
        }
};

var jssor_2_slider = new $JssorSlider$("jssor_2", jssor_2_options);
//
var jssor_3_options = {
          $AutoPlay: true,
          $AutoPlaySteps: 5,
          $SlideDuration: 160,
          $SlideWidth: 130,
          $SlideSpacing: 30,
          $Cols: 4,
          $ArrowNavigatorOptions: {
            $Class: $JssorArrowNavigator$,
            $Steps: 5
          },
          $BulletNavigatorOptions: {
            $Class: $JssorBulletNavigator$,
            $SpacingX: 1,
            $SpacingY: 1
          }
};

var jssor_3_slider = new $JssorSlider$("jssor_3", jssor_3_options);

   
});
