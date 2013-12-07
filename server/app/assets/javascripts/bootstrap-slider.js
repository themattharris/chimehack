!function(a){function b(a,b){if(g[a]){var d=c(this);return g[a].apply(d,b)}throw new Error("method '"+a+"()' does not exist for slider.")}function c(b){var c=a(b).data("slider");if(c&&c instanceof f)return c;throw new Error(e.callingContextNotSliderInstance)}function d(b){var c=a(this),d=c.data("slider"),e="object"==typeof b&&b;return d||c.data("slider",d=new f(this,a.extend({},a.fn.slider.defaults,e))),c}var e={formatInvalidInputErrorMsg:function(a){return"Invalid input value '"+a+"' passed in"},callingContextNotSliderInstance:"Calling context element does not have instance of Slider bound to it. Check your code to make sure the JQuery object returned from the call to the slider() initializer is calling the method"},f=function(b,c){var d=this.element=a(b).hide(),e=d.outerWidth(),f=!1,g=this.element.parent();g.hasClass("slider")===!0?(f=!0,this.picker=g):this.picker=a('<div class="slider"><div class="slider-track"><div class="slider-selection"></div><div class="slider-handle"></div><div class="slider-handle"></div></div><div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div></div>').insertBefore(this.element).append(this.element),this.id=this.element.data("slider-id")||c.id,this.id&&(this.picker[0].id=this.id),"undefined"!=typeof Modernizr&&Modernizr.touch&&(this.touchCapable=!0);var h=this.element.data("slider-tooltip")||c.tooltip;switch(this.tooltip=this.picker.find(".tooltip"),this.tooltipInner=this.tooltip.find("div.tooltip-inner"),this.orientation=this.element.data("slider-orientation")||c.orientation,this.orientation){case"vertical":this.picker.addClass("slider-vertical"),this.stylePos="top",this.mousePos="pageY",this.sizePos="offsetHeight",this.tooltip.addClass("right")[0].style.left="100%";break;default:this.picker.addClass("slider-horizontal").css("width",e),this.orientation="horizontal",this.stylePos="left",this.mousePos="pageX",this.sizePos="offsetWidth",this.tooltip.addClass("top")[0].style.top=-this.tooltip.outerHeight()-14+"px"}["min","max","step","value"].forEach(function(a){this[a]=d.data("slider-"+a)||c[a]||d.prop(a)},this),this.value instanceof Array&&(this.range=!0),this.selection=this.element.data("slider-selection")||c.selection,this.selectionEl=this.picker.find(".slider-selection"),"none"===this.selection&&this.selectionEl.addClass("hide"),this.selectionElStyle=this.selectionEl[0].style,this.handle1=this.picker.find(".slider-handle:first"),this.handle1Stype=this.handle1[0].style,this.handle2=this.picker.find(".slider-handle:last"),this.handle2Stype=this.handle2[0].style;var i=this.element.data("slider-handle")||c.handle;switch(i){case"round":this.handle1.addClass("round"),this.handle2.addClass("round");break;case"triangle":this.handle1.addClass("triangle"),this.handle2.addClass("triangle")}if(this.range?(this.value[0]=Math.max(this.min,Math.min(this.max,this.value[0])),this.value[1]=Math.max(this.min,Math.min(this.max,this.value[1]))):(this.value=[Math.max(this.min,Math.min(this.max,this.value))],this.handle2.addClass("hide"),this.value[1]="after"===this.selection?this.max:this.min),this.diff=this.max-this.min,this.percentage=[100*(this.value[0]-this.min)/this.diff,100*(this.value[1]-this.min)/this.diff,100*this.step/this.diff],this.offset=this.picker.offset(),this.size=this.picker[0][this.sizePos],this.formater=c.formater,this.reversed=this.element.data("slider-reversed")||c.reversed,this.layout(),this.touchCapable?this.picker.on({touchstart:a.proxy(this.mousedown,this)}):this.picker.on({mousedown:a.proxy(this.mousedown,this)}),"show"===h?this.picker.on({mouseenter:a.proxy(this.showTooltip,this),mouseleave:a.proxy(this.hideTooltip,this)}):this.tooltip.addClass("hide"),f===!0){var j=this.getValue(),k=this.calculateValue();this.element.trigger({type:"slide",value:k}).data("value",k).prop("value",k),j!==k&&this.element.trigger({type:"slideChange","new":k,old:j}).data("value",k).prop("value",k)}this.enabled=c.enabled&&(void 0===this.element.data("slider-enabled")||this.element.data("slider-enabled")===!0),this.enabled||this.disable()};f.prototype={constructor:f,over:!1,inDrag:!1,showTooltip:function(){this.tooltip.addClass("in"),this.over=!0},hideTooltip:function(){this.inDrag===!1&&this.tooltip.removeClass("in"),this.over=!1},layout:function(){var a;a=this.reversed?[100-this.percentage[0],this.percentage[1]]:[this.percentage[0],this.percentage[1]],this.handle1Stype[this.stylePos]=a[0]+"%",this.handle2Stype[this.stylePos]=a[1]+"%","vertical"===this.orientation?(this.selectionElStyle.top=Math.min(a[0],a[1])+"%",this.selectionElStyle.height=Math.abs(a[0]-a[1])+"%"):(this.selectionElStyle.left=Math.min(a[0],a[1])+"%",this.selectionElStyle.width=Math.abs(a[0]-a[1])+"%"),this.range?(this.tooltipInner.text(this.formater(this.value[0])+" : "+this.formater(this.value[1])),this.tooltip[0].style[this.stylePos]=this.size*(a[0]+(a[1]-a[0])/2)/100-("vertical"===this.orientation?this.tooltip.outerHeight()/2:this.tooltip.outerWidth()/2)+"px"):(this.tooltipInner.text(this.formater(this.value[0])),this.tooltip[0].style[this.stylePos]=this.size*a[0]/100-("vertical"===this.orientation?this.tooltip.outerHeight()/2:this.tooltip.outerWidth()/2)+"px")},mousedown:function(b){if(!this.isEnabled())return!1;this.touchCapable&&"touchstart"===b.type&&(b=b.originalEvent),this.offset=this.picker.offset(),this.size=this.picker[0][this.sizePos];var c=this.getPercentage(b);if(this.range){var d=Math.abs(this.percentage[0]-c),e=Math.abs(this.percentage[1]-c);this.dragged=e>d?0:1}else this.dragged=0;this.percentage[this.dragged]=this.reversed?100-c:c,this.layout(),this.touchCapable?a(document).on({touchmove:a.proxy(this.mousemove,this),touchend:a.proxy(this.mouseup,this)}):a(document).on({mousemove:a.proxy(this.mousemove,this),mouseup:a.proxy(this.mouseup,this)}),this.inDrag=!0;var f=this.calculateValue();return this.setValue(f),this.element.trigger({type:"slideStart",value:f}).trigger({type:"slide",value:f}),!1},mousemove:function(a){if(!this.isEnabled())return!1;this.touchCapable&&"touchmove"===a.type&&(a=a.originalEvent);var b=this.getPercentage(a);this.range&&(0===this.dragged&&this.percentage[1]<b?(this.percentage[0]=this.percentage[1],this.dragged=1):1===this.dragged&&this.percentage[0]>b&&(this.percentage[1]=this.percentage[0],this.dragged=0)),this.percentage[this.dragged]=this.reversed?100-b:b,this.layout();var c=this.calculateValue();return this.setValue(c),this.element.trigger({type:"slide",value:c}).data("value",c).prop("value",c),!1},mouseup:function(){if(!this.isEnabled())return!1;this.touchCapable?a(document).off({touchmove:this.mousemove,touchend:this.mouseup}):a(document).off({mousemove:this.mousemove,mouseup:this.mouseup}),this.inDrag=!1,this.over===!1&&this.hideTooltip();var b=this.calculateValue();return this.layout(),this.element.trigger({type:"slideStop",value:b}).data("value",b).prop("value",b),!1},calculateValue:function(){var a;return this.range?(a=[Math.max(this.min,this.min+Math.round(this.diff*this.percentage[0]/100/this.step)*this.step),Math.min(this.max,this.min+Math.round(this.diff*this.percentage[1]/100/this.step)*this.step)],this.value=a):(a=this.min+Math.round(this.diff*this.percentage[0]/100/this.step)*this.step,a<this.min?a=this.min:a>this.max&&(a=this.max),a=parseFloat(a),this.value=[a,this.value[1]]),a},getPercentage:function(a){this.touchCapable&&(a=a.touches[0]);var b=100*(a[this.mousePos]-this.offset[this.stylePos])/this.size;return b=Math.round(b/this.percentage[2])*this.percentage[2],Math.max(0,Math.min(100,b))},getValue:function(){return this.range?this.value:this.value[0]},setValue:function(a){this.value=this.validateInputValue(a),this.range?(this.value[0]=Math.max(this.min,Math.min(this.max,this.value[0])),this.value[1]=Math.max(this.min,Math.min(this.max,this.value[1]))):(this.value=[Math.max(this.min,Math.min(this.max,this.value))],this.handle2.addClass("hide"),this.value[1]="after"===this.selection?this.max:this.min),this.diff=this.max-this.min,this.percentage=[100*(this.value[0]-this.min)/this.diff,100*(this.value[1]-this.min)/this.diff,100*this.step/this.diff],this.layout()},validateInputValue:function(a){if("number"==typeof a)return a;if(a instanceof Array)return a.forEach(function(a){if("number"!=typeof a)throw new Error(e.formatInvalidInputErrorMsg(a))}),a;throw new Error(e.formatInvalidInputErrorMsg(a))},destroy:function(){this.element.show().insertBefore(this.picker),this.picker.remove(),a(this.element).removeData("slider"),a(this.element).off()},disable:function(){this.enabled=!1,this.picker.addClass("slider-disabled"),this.element.trigger("slideDisabled")},enable:function(){this.enabled=!0,this.picker.removeClass("slider-disabled"),this.element.trigger("slideEnabled")},toggle:function(){this.enabled?this.disable():this.enable()},isEnabled:function(){return this.enabled}};var g={getValue:f.prototype.getValue,setValue:f.prototype.setValue,destroy:f.prototype.destroy,disable:f.prototype.disable,enable:f.prototype.enable,toggle:f.prototype.toggle,isEnabled:f.prototype.isEnabled};a.fn.slider=function(a){if("string"==typeof a){var c=Array.prototype.slice.call(arguments,1);return b.call(this,a,c)}return d.call(this,a)},a.fn.slider.defaults={min:0,max:10,step:1,orientation:"horizontal",value:5,selection:"before",tooltip:"show",handle:"round",reversed:!1,enabled:!0,formater:function(a){return a}},a.fn.slider.Constructor=f}(window.jQuery);