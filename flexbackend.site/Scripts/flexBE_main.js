window.onload = function () {
    const sidebarToggle = document.querySelector('#sidebar-toggle input[type="checkbox"]');
    const sidebarToggleIcon = document.querySelector('#sidebar-toggle>label');
    const sidebar = document.querySelector("#sidebar");
    const closeBtn = document.querySelector('#sidebar .close-btn');
    const sidebarBG = document.querySelector('#sidebar-bg');
    const collapseBtns = document.querySelectorAll(".collapse-btn");
    const sidebarMain = document.querySelector(".sidebar-main");

    // 點擊關閉按鈕關閉左側Menu
    closeBtn.addEventListener('click', resetSidebarSwitch);
    // 點擊左側Menu展開時後方大背景時，關閉左側Menu
    sidebarBG.addEventListener('click', resetSidebarSwitch);
    // 調整畫面大小時，關閉左側Menu
    window.addEventListener('resize', resetSidebarSwitch);
    // 點擊toggole按鈕，切換左側Menu狀態
    sidebarToggle.addEventListener("change", sidebarSwitch);

    // 小畫面時左側Menu預設為關閉狀態
    function resetSidebarSwitch() {
        sidebarToggle.checked = false;
        sidebarSwitch();
    }

    // 小畫面時左側Menu切換展開/收縮功能
    function sidebarSwitch() {
        if (sidebarToggle.checked) {
            sidebarToggleIcon.classList.add("active");
            sidebar.classList.remove("left-hidden");
            closeBtn.classList.add("show");
            sidebarBG.classList.add("show");
            sidebarMain.scrollTop = 0;
        }
        else {
            sidebarToggleIcon.classList.remove("active");
            sidebar.classList.add("left-hidden");
            closeBtn.classList.remove("show");
            sidebarBG.classList.remove("show");
            document.querySelectorAll(".collapse-item:not(.hide)").forEach(item => {
                item.classList.add("hide");
            })
            document.querySelectorAll(".bi-chevron-down.rotate-180").forEach(item => {
                item.classList.remove("rotate-180");
            })
        }
    }

    // 左側Menu按鈕手風琴效果
    collapseBtns.forEach(function (btn) {
        btn.addEventListener("click", function () {
            let target = document.querySelector(this.getAttribute("data-id"));
            if (!target.classList.contains("hide")) {
                target.classList.add("hide");
                this.querySelector(".bi-chevron-down").classList.remove("rotate-180");
                return;
            }
            let collapseItems = document.querySelectorAll(".collapse-item");
            collapseItems.forEach(function (item) {
                item.classList.add("hide");
            });
            let chevronDownIcons = document.querySelectorAll(".bi-chevron-down");
            chevronDownIcons.forEach(function (icon) {
                icon.classList.remove("rotate-180");
            });
            target.classList.remove("hide");
            this.querySelector(".bi-chevron-down").classList.add("rotate-180");
        });
    });

    // 綁定點擊秀出通知框事件
    let bellIcon = document.querySelector(".header-right-wrapper .bell");
    bellIcon.addEventListener("click", function () {
        setInfoBoxDisplay(this, "bi-bell");
    });

    // 秀出框框程式
    // 須配合bootstrap使用，且該icon必須有fill版樣式可以切換
    function setInfoBoxDisplay(target, strClassToFill) {
        event.stopPropagation();
        if (!target.nextElementSibling.classList.contains("d-none")) {
            resetInfoBox();
            return;
        }
        resetInfoBox();
        target.querySelector("i").classList.remove(strClassToFill);
        target.querySelector("i").classList.add(strClassToFill + "-fill");
        target.querySelector("i").classList.add("active");
        target.nextElementSibling.classList.remove("d-none");
    }

    // 在框框顯示的情況下，點擊框框以外地方時，隱藏框框並重置按鈕樣式。
    document.body.addEventListener("click", function (event) {
        let targetIsNotBellBox =
            !event.target.matches("#notification-box") &&
            !event.target.closest("#notification-box") &&
            !document.querySelector("#notification-box").classList.contains("d-none");

        if (targetIsNotBellBox) {
            resetInfoBox();
        }
    });

    // 重置下拉通知按鈕及通知框
    function resetInfoBox() {
        document.querySelector("#notification-box").classList.add("d-none");
        document.querySelector("#notification-wrapper i").classList.add("bi-bell");
        document.querySelector("#notification-wrapper i").classList.remove("bi-bell-fill");
        document.querySelector("#notification-wrapper i").classList.remove("active");
    }

};

// jquery版寫法保留
/* $(function () {
    // 左側Menu按鈕手風琴效果
    $('.collapse-btn').on('click', function () {
        let target = $($(this).data("id"))
        if (!target.hasClass("hide")) {
            target.addClass("hide");
            $(this).find(".bi-chevron-down").removeClass("rotate-180");
            return;
        }
        $('.collapse-item').addClass("hide");
        $('.bi-chevron-down').removeClass("rotate-180");
        target.removeClass("hide");
        $(this).find(".bi-chevron-down").addClass("rotate-180");
    })

    // 綁定點擊秀出通知框事件
    $('.header-right-wrapper .bell').on('click', function () {
        setInfoBoxDisplay($(this), 'bi-bell');
    });

    // 秀出框框程式
    // 須配合bootstrap使用，且該icon必須有fill版樣式可以切換
    function setInfoBoxDisplay(target, strClassToFill) {
        event.stopPropagation()
        if (!target.next().hasClass('d-none')) {
            resetInfoBox();
            return;
        }
        resetInfoBox();
        target.find('i').removeClass(strClassToFill).addClass(strClassToFill + '-fill').addClass('active');
        target.next().removeClass('d-none');
    }

    // 在框框顯示的情況下，點擊框框以外地方時，隱藏框框並重置按鈕樣式。
    $('body').on('click', function (event) {
        let targetIsNotBellBox = !$(event.target).is('#notification-box')
            && !$(event.target).closest('#notification-box').length
            && !$('#notification-box').hasClass('d-none');

        if (targetIsNotBellBox) {
            resetInfoBox();
        }
    });

    // 重置下拉通知按鈕及通知框
    function resetInfoBox() {
        $('#notification-box').addClass('d-none');
        $('#notification-wrapper i').addClass('bi-bell').removeClass('bi-bell-fill').removeClass('active');
    }
}) */