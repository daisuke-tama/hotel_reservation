$(document).on('turbolinks:load', function() {
  let areaLinks = {
	 1:"hotels/index_prefectures_name_search?prefecture_keyword=北海道地方",
	 2:"hotels/index_prefectures_name_search?prefecture_keyword=東北地方",
	 3:"hotels/index_prefectures_name_search?prefecture_keyword=関東地方",
	 4:"hotels/index_prefectures_name_search?prefecture_keyword=北陸・甲信越地方",
	 5:"hotels/index_prefectures_name_search?prefecture_keyword=東海地方",
	 6:"hotels/index_prefectures_name_search?prefecture_keyword=近畿地方",
	 7:"hotels/index_prefectures_name_search?prefecture_keyword=中国地方",
	 8:"hotels/index_prefectures_name_search?prefecture_keyword=四国地方",
	 9:"hotels/index_prefectures_name_search?prefecture_keyword=九州地方",
	 10:"hotels/index_prefectures_name_search?prefecture_keyword=沖縄"
    };
    
    let areas = [
        {code: 1 , name:"北海道", color:"#ca93ea", hoverColor:"#e0b1fb", prefectures:[1]},
        {code: 2 , name:"東北", color:"#a7a5ea", hoverColor:"#d6d4fd", prefectures:[2,3,4,5,6,7]},
        {code: 3 , name:"関東", color:"#84b0f6", hoverColor:"#c1d8fd", prefectures:[8,9,10,11,12,13,14]},
        {code: 4 , name:"北陸・甲信越", color:"#52d49c", hoverColor:"#93ecc5", prefectures:[15,16,17,18,19,20]},
        {code: 4 , name:"東海", color:"#77e18e", hoverColor:"#aff9bf", prefectures:[21,22,23,24]},
        {code: 6 , name:"近畿", color:"#f2db7b", hoverColor:"#f6e8ac", prefectures:[25,26,27,28,29,30]},
        {code: 7 , name:"中国", color:"#f9ca6c", hoverColor:"#ffe5b0", prefectures:[31,32,33,34,35]},
        {code: 8 , name:"四国", color:"#fbad8b", hoverColor:"#ffd7c5", prefectures:[36,37,38,39]},
        {code: 9 , name:"九州", color:"#f7a6a6", hoverColor:"#ffcece", prefectures:[40,41,42,43,44,45,46]},
        {code:10 , name:"沖縄", color:"#ea89c4", hoverColor:"#fdcae9", prefectures:[47]}
    ];

    
    $("#map-container").japanMap({
        width:600,
        areas  : areas,
        selection : "area",
        borderLineWidth: 0.25,
        drawsBoxLine : false,
        movesIslands : true,
        showsAreaName : true,
        font : "MS Mincho",
        fontSize : 13,
        fontColor :"#777",
        fontShadowColor : "white",
        onSelect : function(data){
            location.href = areaLinks[data.area.code];
        }
    });

});
