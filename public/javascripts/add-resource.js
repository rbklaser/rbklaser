$(function(){
	$("form[data-remote]").each(function(i, form){

        var f = $(form);
        var loading = $("<div class='form_loading'></div>");
            notice  = $("<div class='form_notice'></div>");
            errors  = $("<ul class='form_errore'></ul>");
        
        f.append(loading.hide())
        f.prepend(notice.hide())
        f.prepend(errors.hide())

        f.bind("ajax:loading", function(){ 
            errors.hide(); 
            notice.hide(); 
            loading.show();
            
        })
        f.bind("ajax:complete", function() { 
            loading.hide();
        })
        f.bind("ajax:success", function(ev, data, status, xhr){ 
        	notice.text("Dodano źródło nauki!").show(); 

            $("#resource_name").val("");
            $("#resource_content").val("");
            $("#resource_url").val("");

            var response = $.parseJSON(data);
            if (response.resource.url != ''){
            	var link = '<a href="'+response.resource.url+'">Link do zewnetrznego zrodla nauki</a>';
            }
            else {
            	var link = '';
            }
            
            if (response.resource.content !=''){
            	var content = '<p>'+response.resource.content+'</p>';
            }
            $("#resources").append('<div class="resource"><h4>'+ response.resource.name +'</h4>'+
            		link+content + '</div>');
            
            
        })
        f.bind("ajax:failure", function(ev, xhr, status){
            errors.html("")
            $.parseJSON(xhr.responseText).forEach(function(msg){
                errors.append("<li>" + msg + "</li>")
            })
            errors.show()
        })
    })
})