tinymce.PluginManager.add("anchor",function(e){var t=function(e){return!e.attr("href")&&(e.attr("id")||e.attr("name"))&&!e.firstChild},n=function(e){return function(n){for(var r=0;r<n.length;r++)t(n[r])&&n[r].attr("contenteditable",e)}},r=function(e){return/^[A-Za-z][A-Za-z0-9\-:._]*$/.test(e)},i=function(){var t=e.selection.getNode(),n="A"==t.tagName&&""===e.dom.getAttrib(t,"href"),i="";n&&(i=t.id||t.name||""),e.windowManager.open({title:"Anchor",body:{type:"textbox",name:"id",size:40,label:"Id",value:i},onsubmit:function(i){var o=i.data.id;return r(o)?void(n?(t.removeAttribute("name"),t.id=o):(e.selection.collapse(!0),e.execCommand("mceInsertContent",!1,e.dom.createHTML("a",{id:o})))):(i.preventDefault(),void e.windowManager.alert("Id should start with a letter, followed only by letters, numbers, dashes, dots, colons or underscores."))}})};tinymce.Env.ceFalse&&e.on("PreInit",function(){e.parser.addNodeFilter("a",n("false")),e.serializer.addNodeFilter("a",n(null))}),e.addCommand("mceAnchor",i),e.addButton("anchor",{icon:"anchor",tooltip:"Anchor",onclick:i,stateSelector:"a:not([href])"}),e.addMenuItem("anchor",{icon:"anchor",text:"Anchor",context:"insert",onclick:i})});