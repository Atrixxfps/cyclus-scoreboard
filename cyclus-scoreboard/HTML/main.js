$(document).ready(function() {
    $(".board").hide();
    window.addEventListener('message', function(event) {
        switch (event.data.action) {
            case "open":
                OpenScoreboard(event.data);
                break;
            case "close":
                CloseScoreboard();
                break;
        }
    });
})

function OpenScoreboard(data) {
    $(".board").show();
    $('.board').animate({ 'right': '0' }, 450);

    $("#title").html(" "+data.serverNaam+" ");

    $("#NaamBox1").html(" "+data.naamBox1+" ");
    $("#NaamBox2").html(" "+data.naamBox2+" ");
    $("#NaamBox3").html(" "+data.naamBox3+" ");
    $("#NaamBox4").html(" "+data.naamBox4+" ");

    $("#police").css('color', 'rgba(255, 255, 255, 0.8)').html(" "+data.police+" ");
    $("#ambulance").css('color', 'rgba(255, 255, 255, 0.8)').html(" "+data.ambulance+" ");
    $("#mechanic").css('color', 'rgba(255, 255, 255, 0.8)').html(" "+data.mechanic+" ");
    $("#firefighter").css('color', 'rgba(255, 255, 255, 0.8)').html(" "+data.firefighter+" ");

    $("#player-count").html("<p>"+data.spelers+" | "+data.maxSpelers+"</p>");
    $.each(data.vereisteWouten, function(i, category){
        var job = $(".scoreboard-info").find('[data-type="'+i+'"]');
        var status = $(job).find(".interactie-checkboxes-status");

        if (category.busy) {
            $(status).html('<i class="fas fa-clock"></i>');
        } else if (data.currentWouten >= category.minimum) {
            $(status).html('<i class="fas fa-check"></i>');
        } else {
            $(status).html('<i class="fas fa-times"></i>');
        }
    });
}


function CloseScoreboard() {
    $('.board').animate({ 'right': '-50vh' }, 450, function() {
        $(".board").hide();
    })
}