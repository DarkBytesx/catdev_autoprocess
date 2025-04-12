let showna = false
$(function () {
    $('#app').html(`
    <div class="box-container">
			<div class="keed2"></div>
			<div class="keed3"></div>
			
			<div class="container">
				<div class="header-text-Label">
					<p id="HeaderPro">Process</p>&nbsp;<p id="TextHeader">Mining</p>
				</div>
				<i class='bx bx-loader-circle'></i>

				<div class="box-text-cancel">
					<p>PRESS <p id="presscancel">Q</p> TO CANCEL AUTO PROCESS</p>
				</div>
				<div class="load-bar" id="load-bar">
					<div class="load" id="load"></div>
				</div>
				<div class="box-slot-pc">
					<div class="container-pc">
						<div class="slot">
							<div class="boximg-slot">
								<img src="/Interface/diamondore.png" alt="">
							</div>
							<div class="keed"></div>
							<div class="name-item">
								<i class='bx bx-radio-circle-marked'></i><p>&nbsp;Diamond</p>
							</div>
							<div class="amount-item">
								<i class='bx bx-radio-circle-marked'></i><p>&nbsp;Amount x <p>22</p></p>
							</div>
						</div>
						
					</div>

					<div class="container-get">
						<div class="slot-get">
							<div class="boximg-slot-get">
								<img src="/Interface/diamondore.png" alt="">
							</div>
							<div class="box-name-amount">
								<div class="name-get-amount">
									<p>Diamond</p>
								</div>
								<div class="amount-get">
									x<p>100</p>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
    `)
    function display(bool) {
        if (bool) {
            $(".box-container").css('animation', 'In .5s forwards')
        } else {
            $(".box-container").css('animation', 'Out .5s forwards')
        }
    }

    window.addEventListener('message', function(event) {
        var item = event.data;

        if (item.action == "Opentext") {
            $(".box-container-text-ui").css('animation', 'Intext .5s forwards')
            $("#text-name").html(`${event.data.Name}`);
            $("#press").html(`${event.data.TextPress}`);
            $("#presscancel").html(`${event.data.TextCancel}`);
        }
        if (item.action == "Closetext") {
            $(".box-container-text-ui").css('animation', 'Outtext .5s forwards')
        }
        if (item.type === "ui") {

            if (item.status == true) {
                display(true)
                $("#HeaderPro").html(`${event.data.HeaderText}`);
                $("#TextHeader").html(`${event.data.TextName}`);
            } else {
                display(false)
            }

        } else if (item.type === "UPDATE_HUD") {

            ITEM_PATH = item.PATH;

            ITEM_LIST = item.Itemlist
            ITEM_LIST_REMOVE = item.ItemlistRemove
            
            $(".container-pc").html("");
            $(".container-get").html("");
            $.each(ITEM_LIST_REMOVE, function(index, item) {
                var apps = $(`
                <div class="slot">
                    <div class="boximg-slot">
                    <img src="${ITEM_PATH + item.ItemName + '.png'}" alt="">
                    </div>
                    <div class="keed"></div>
                    <div class="name-item">
                        <p><i class='bx bx-radio-circle-marked'></i>&nbsp;${item.Text}</p>
                    </div>
                    <div class="amount-item">
                        <p><i class='bx bx-radio-circle-marked'></i>&nbsp;Amount x <p>${item.count}</p></p>
                    </div>
                </div>`);
                $(".container-pc").append(apps);
            });


            // console.log(JSON.stringify(ITEM_LIST, null, 2))

            $.each(ITEM_LIST, function(index, item) {
                // console.log(item.Name);
                var app = $(`
                <div class="slot-get">
                    <div class="boximg-slot-get">
                    <img src="${ITEM_PATH + item.ItemName + '.png'}" alt="">
                    </div>
                    <div class="box-name-amount">
                        <div class="name-get-amount">
                            <p>${item.Text}</p>
                        </div>
                        <div class="amount-get">
                            x<p>${item.count}</p>
                        </div>
                    </div>
                    
                </div>`);
                $(".container-get").append(app);

        
                $("#load-bar").css({"display":"block"});
                $("#load-bar").slideDown(0)
                if (showna == false){
                    showna = true
                    $("#load").stop().css({"width": 0}).animate({width: '100%'}, {
                        duration: parseInt(event.data.Time*1000),
                        complete: function() {
                            $("#load").css("width", 0);
                            const audio = new Audio();
                            audio.src = "./Sound/Success.mp3";
                            audio.play()
                            audio.volume = 0.25; 
                            showna = false
                        }
                    });
                }
            });
        }

    })
})


