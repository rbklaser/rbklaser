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
            notice.text(data).show(); 
            // Czyścimy pola tylko w przypadku sukcesu
            $("#resource_name").val("");
            $("#resource_content").val("");
            $("#resource_url").val("");
            // Trzeba będzie jeszcze skądś wydobyć z wszystkie źródła, a MOŻE nawet je stronicować i wyświetlić od nowa
            
            
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