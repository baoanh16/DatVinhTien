$(document).ready(function () {
	var bp = {
		"sm": 576,
		"md": 768,
		"lg": 1025,
		"xl": 1200,
		"xxl": 1440,
	},
		isScrolled = false;

	// chuyển mấy cái html trên header khi xuống mobile
	var moveMenu1 = new MappingListener({
		selector: "header .search",
		mobileWrapper: "header .mobile-menu",
		mobileMethod: "appendTo",
		desktopWrapper: "header .hotline",
		desktopMethod: "insertAfter",
		breakpoint: bp.xl,
	}).watch()

	var moveMenu2 = new MappingListener({
		selector: "header .menu-1",
		mobileWrapper: "header .mobile-menu",
		mobileMethod: "appendTo",
		desktopWrapper: "header .bottom-header .logo-wrapper",
		desktopMethod: "insertBefore",
		breakpoint: bp.xl,
	}).watch()

	var moveMenu3 = new MappingListener({
		selector: "header .menu-2",
		mobileWrapper: "header .mobile-menu",
		mobileMethod: "appendTo",
		desktopWrapper: "header .bottom-header .logo-wrapper",
		desktopMethod: "insertAfter",
		breakpoint: bp.xl,
	}).watch()


	if ($(window).scrollTop() > 0) {
		$('header').addClass('active-logo')
	} else {
		$('header').removeClass('active-logo')
	}
	if ($(window).width() >= 1200) {
		$($(window).on('scroll', function () {
			if ($(window).scrollTop() > 0) {
				$('header').addClass('active-logo')
			} else {
				$('header').removeClass('active-logo')
			}
		}))
	}

	// xuống mobile add thêm backdrop
	function addBackdrop(breakpoint) {
		if (breakpoint.matches) {
			$('header').append("<div class='backdrop'></div>")
		} else {
			$('.backdrop').remove()
		}
	}
	var bpMedia = window.matchMedia('(max-width: 1199.98px)')
	addBackdrop(bpMedia)
	bpMedia.addListener(addBackdrop)

	// Jquery
	// Header scripts
	$(window).on('resize', function () {
		$('header .mobile-menu').removeClass('open')
		$('body').removeClass('over-hidden')
		$('.backdrop').removeClass('open')
	})

	$('body').on('click', '.backdrop', function () {
		$('header .mobile-menu').removeClass('open')
		$('body').removeClass('over-hidden')
		$('.backdrop').removeClass('open')
	})

	$('header .mobile-toggle').on('click', function () {
		$('header .mobile-menu').toggleClass('open')
		if ($('header .mobile-menu').hasClass('open')) {
			$('body').addClass('over-hidden')
			$('.backdrop').addClass('open')
		} else {
			$('body').removeClass('over-hidden')
			$('.backdrop').removeClass('open')
		}
	})

	if ($(window).width() < bp.sm) {
		$('footer .footer-navigation-item h3').each(function () {
			$(this).on('click', function () {
				$(this).siblings('ul').slideToggle()
				$(this).parents('.footer-navigation-item').siblings('.footer-navigation-item').find('ul').slideUp()
			})
		})
	}

	// Home scripts
	let homeBanner = new Swiper('.home-banner .swiper-container', {
		slidesPerView: 1,
		loop: true,
		speed: 1200,
		lazy: true,
		// autoplay: {
		// 	disableOnInteraction: false,
		// 	delay: 4500,
		// },
		effect: 'coverflow',
		coverflowEffect: {
			slideShadows: false,
			rotate: 0,
			stretch: 4,
			depth: 50,
			modifier: 2,
		},
		navigation: {
			prevEl: '.home-banner .lnr-chevron-left',
			nextEl: '.home-banner .lnr-chevron-right'
		},
		on: {
			init: function () {
				$('.home-banner .swiper-slide').height($(window).height() - $('header').height())
				if ($(window).width() < 768) {
					$('.home-banner .swiper-slide').each(function () {
						if ($(this).attr('data-background-mobile').length > 0) {
							$(this).css({
								"background-image": 'url("' + $(this).attr('data-background-mobile') + '")'
							})
						} else {
							$(this).css({
								"background-image": 'url("' + $(this).attr('data-background') + '")'
							})
						}
					})
				} else {
					$('.home-banner .swiper-slide').each(function () {
						$(this).css({
							"background-image": 'url("' + $(this).attr('data-background') + '")'
						})
					})
				}
			},
			resize: function () {
				if ($(window).width() < 768) {
					$('.home-banner .swiper-slide').each(function () {
						if ($(this).attr('data-background-mobile').length > 0) {
							$(this).css({
								"background-image": 'url("' + $(this).attr('data-background-mobile') + '")'
							})
						} else {
							$(this).css({
								"background-image": 'url("' + $(this).attr('data-background') + '")'
							})
						}
					})
				} else {
					$('.home-banner .swiper-slide').each(function () {
						$(this).css({
							"background-image": 'url("' + $(this).attr('data-background') + '")'
						})
					})
				}
			},
			slideChangeTransitionEnd: function () {
				$('.home-banner .swiper-slide').find('.caption').removeClass('active')
				$('.home-banner .swiper-slide-active').find('.caption').addClass('active')
			}
		}
	})

	$('.home-banner .btn-down').on('click', function () {
		$('html,body').animate({
			scrollTop: $('.home-2').offset().top - $('header').height()
		}, 1000)
	})

	function HomeCounter(isScrolled) {
		if (isScrolled == false) {
			$('[data-count]').each(function () {
				$(this).animate({
					Counter: $(this).attr('data-count')
				}, {
						duration: 2300,
						easing: 'swing',
						step: function (now) {
							if (now >= this.Counter) {
								$(this).text(Math.ceil(now));
							}
						}
					});
			});
			isScrolled = true;
		}
	}
	$(window).on('scroll', function () {
		if ($('.home-3').length > 0)
			var scrollPoint = $('.home-3').offset().top - $(window).height() - ($('.home-3').height() / 2)
		if ($(window).scrollTop() >= scrollPoint) {
			HomeCounter(isScrolled)
		}
	})

	function Tab(selectorTab) {
		var tabItem = $('[tab-for="' + selectorTab + '"] .tab-item')
		var tabContent = $('[tab-content="' + selectorTab + '"] .tab-content')
		tabItem.each(function () {
			$(this).on('click', function (e) {
				e.preventDefault()
				$(this).addClass('active')
				$(this).siblings('.tab-item').removeClass('active')
				let target = $('[tab-content="' + selectorTab + '"] ' + $(this).attr('href'))
				tabContent.not(target).hide().removeClass('show')
				$(target).fadeIn('slow').addClass('show')
			})
		})
	}
	$('[tab-for]').each(function () {
		var targetTab = $(this).attr('tab-for')
		Tab(targetTab)
	})

	var HomeProductSlider = new Swiper('.home-4 .products-list .swiper-container', {
		slidesPerView: 4,
		slidesPerColumn: 2,
		observer: true,
		observeParents: true,
		lazy: true,
		breakpoints: {
			1025: {
				slidesPerColumn: 1,
				slidesPerView: 3,
				spaceBetween: 20,
			},
			768: {
				slidesPerColumn: 1,
				slidesPerView: 2,
				spaceBetween: 20,
			}
		},
		navigation: {
			prevEl: '.home-4 .products-list .swiper-nav .lnr-chevron-left',
			nextEl: '.home-4 .products-list .swiper-nav .lnr-chevron-right'
		}
	})

	// Section khách hàng và đối tác
	var HomeCustomerSliderOption = {
		slidesPerView: 4,
		slidesPerColumn: 2,
		lazy: true,
		observer: true,
		observeParents: true,
		breakpoints: {
			1024: {
				slidesPerColumn: 1,
				slidesPerView: 4,
				spaceBetween: 20,
			},
			767: {
				slidesPerColumn: 1,
				slidesPerView: 3,
				spaceBetween: 10,
			},
			575: {
				slidesPerColumn: 1,
				slidesPerView: 2,
				spaceBetween: 10,
			}
		}
	}
	var HomeCustomerSliderOption3 = {
		navigation: {
			prevEl: '.home-5 #tab-content-2 .block-1 .swiper-nav .lnr-arrow-left',
			nextEl: '.home-5 #tab-content-2 .block-1 .swiper-nav .lnr-arrow-right'
		}
	},
		HomeCustomerSliderOption4 = {
			navigation: {
				prevEl: '.home-5 #tab-content-2 .block-2 .swiper-nav .lnr-arrow-left',
				nextEl: '.home-5 #tab-content-2 .block-2 .swiper-nav .lnr-arrow-right'
			}
		};

	$.extend(HomeCustomerSliderOption3, HomeCustomerSliderOption)
	$.extend(HomeCustomerSliderOption4, HomeCustomerSliderOption)

	var HomeCustomerSlider1 = new Swiper('.home-5 #tab-content-1 .block-1 .swiper-container', {
		navigation: {
			prevEl: '.home-5 #tab-content-1 .block-1 .swiper-nav .lnr-arrow-left',
			nextEl: '.home-5 #tab-content-1 .block-1 .swiper-nav .lnr-arrow-right'
		},
		slidesPerView: 8,
		// slidesPerColumn: 2,
		lazy: true,
		breakpoints: {
			1024: {
				slidesPerColumn: 1,
				slidesPerView: 4,
				spaceBetween: 20,
			},
			767: {
				slidesPerColumn: 1,
				slidesPerView: 3,
				spaceBetween: 10,
			},
			575: {
				slidesPerColumn: 1,
				slidesPerView: 2,
				spaceBetween: 10,
			}
		}
	})
	var HomeCustomerSlider3 = new Swiper('.home-5 #tab-content-2 .block-1 .swiper-container', HomeCustomerSliderOption3)
	var HomeCustomerSlider4 = new Swiper('.home-5 #tab-content-2 .block-2 .swiper-container', HomeCustomerSliderOption4)

	$('.home-5 .home-tab a').eq(1).on('click', function () {
		if ($(this).index() == 1) {
			HomeCustomerSlider3.update()
			HomeCustomerSlider4.update()
		}
	})


	// Page Banner
	var pageBanner = new Swiper('.page-banner .swiper-container', {
		effect: 'fade',
		lazy: true,
		fadeEffect: {
			crossFade: true
		},
		speed: 1200,
		slidesPerView: 1,
		loop: true,
		autoplay: {
			delay: 3000,
		},
		allowTouchMove: false,
	})
	// Trang about
	// if ($(window).outerWidth() >= 1025) {
	// 	$('.about-1 .textbox').height($('.about-1 .imgbox img').height())
	// } else {
	// 	$('.about-1 .textbox').css({
	// 		"height": "unset",
	// 	})
	// }
	$(window).on('resize', function () {
		if ($(window).width() >= 1025) {
			$('.about-1 .textbox').height($('.about-1 .imgbox').height())
		} else {
			$('.about-1 .textbox').css({
				"height": "unset",
			})
		}
	})
	if ($('.about-3').length > 0) {
		var aboutYearSlider = new Swiper('.about-3 .year .swiper-container', {
			slidesPerView: 4,
			centeredSlides: true,
			slideToClickedSlide: true,
			spaceBetween: 20,
			lazy: true,
			navigation: {
				prevEl: '.about-3 .year .swiper-nav .lnr-arrow-left',
				nextEl: '.about-3 .year .swiper-nav .lnr-arrow-right'
			},
			initialSlide: 2,
			breakpoints: {
				768: {
					slidesPerView: 3,
				},
				576: {
					centeredSlides: false,
					slidesPerView: 2,
				}
			}
		})

		var aboutYearInfoSlider = new Swiper('.about-3 .year-info .swiper-container', {
			direction: 'vertical',
			slidesPerView: 2,
			spaceBetween: 20,
			freeMode: true,
			autoHeight: true,
			lazy: true,
			slideToClickedSlide: true,
		})
		aboutYearInfoSlider.controller.control = aboutYearSlider;
		aboutYearSlider.controller.control = aboutYearInfoSlider;
	}

	var abouVerify = new Swiper('.about-4 .swiper-container', {
		slidesPerView: 4,
		speed: 1200,
		autoplay: {
			delay: 4000,
			disabelOnInteraction: false,
		},
		spaceBetween: 40,
		navigation: {
			prevEl: '.about-4 .swiper-prev',
			nextEl: '.about-4 .swiper-next'
		},
		breakpoints: {
			1024: {
				slidesPerView: 3,
			},
			768: {
				slidesPerView: 2,
			},
			576: {
				slidesPerView: 1,
			}
		},
		on: {
			init: function () {
				var arr = []
				$('.about-4 .swiper-slide .imgbox').each(function () {
					arr.push($(this).height())
				})
				var maxSlide = Math.max(...arr)
				$('.about-4 .swiper-slide .imgbox').each(function () {
					$(this).height(maxSlide)
				})
			}
		}
	})

	var CustomerOption = {
		slidesPerView: 5,
		slideToClickedSlide: true,
		speed: 800,
		loop: true,
		lazy: true,
		observer: true,
		observeParents: true,
		autoplay: {
			delay: 3000,
			disabelOnInteraction: false,
		},
		breakpoints: {
			1025: {
				slidesPerView: 4,
			},
			768: {
				slidesPerView: 3,
			},
			576: {
				slidesPerView: 2,
			}
		}
	}

	var CustomerNavigationOption1 = {
		navigation: {
			prevEl: '.about-5 .slider-1 .swiper-prev',
			nextEl: '.about-5 .slider-1 .swiper-next'
		}
	},
		CustomerNavigationOption2 = {
			navigation: {
				prevEl: '.about-5 .slider-2 .swiper-prev',
				nextEl: '.about-5 .slider-2 .swiper-next'
			}
		},
		CustomerNavigationOption3 = {
			navigation: {
				prevEl: '.about-5 .slider-3 .swiper-prev',
				nextEl: '.about-5 .slider-3 .swiper-next'
			}
		};
	$.extend(CustomerNavigationOption1, CustomerOption)
	$.extend(CustomerNavigationOption2, CustomerOption)
	$.extend(CustomerNavigationOption3, CustomerOption)
	var CustomerSlider1 = new Swiper('.about-5 .slider-1 .swiper-container', CustomerNavigationOption1)
	var CustomerSlider2 = new Swiper('.about-5 .slider-2 .swiper-container', CustomerNavigationOption2)
	var CustomerSlider3 = new Swiper('.about-5 .slider-3 .swiper-container', CustomerNavigationOption3)



	// Trang san pham
	$('.side-menu .side-menu-item h3').on('click', function () {
		$(this).siblings('ul').slideToggle()
		$(this).parent().toggleClass('active')
		$(this).parent().siblings('.side-menu-item').find('ul').slideUp()
		$(this).parent().siblings('.side-menu-item').removeClass('active')
	})
	$('.side-menu .side-menu-mobile-header').on('click', function () {
		$('.side-menu .side-menu-list').slideToggle()
	})

	if ($('.product-detail').length > 0) {
		var ProductBigImageSlider = new Swiper('.product-detail .product-images', {
			slidesPerView: 1,
			effect: 'fade',
			lazy: true,
			fadeEffect: {
				crossFade: true,
			},
			on: {
				init: function () {
					$('.product-detail .product-thumbnails').height(340)
				}
			},
			loop: true,
			freeMode: true,
			loopedSlides: 5, //looped slides should be the same
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
			// thumbs: {
			// 	swiper: ProductSmallImageSlider,
			// }
		})
		var ProductSmallImageSlider = new Swiper('.product-detail .product-thumbnails', {
			slidesPerView: 4,
			direction: 'vertical',
			centeredSlides: true,
			freeMode: true,
			spaceBetween: 10,
			slideToClickedSlide: true,
			lazy: true,
			loop: true,
			loopedSlides: 5,
			fadeEffect: {
				crossFade: true,
			},
			navigation: {
				prevEl: '.product-detail .product-thumbnails-nav .lnr-chevron-up',
				nextEl: '.product-detail .product-thumbnails-nav .lnr-chevron-down',
			}
		})
		ProductSmallImageSlider.controller.control = ProductBigImageSlider;
		ProductBigImageSlider.controller.control = ProductSmallImageSlider;
	}



	var ProductUsedByProjects = new Swiper('.product-used-by-projects .swiper-container', {
		slidesPerView: 3,
		spaceBetween: 20,
		loop: true,
		speed: 1200,
		lazy: true,
		autoplay: {
			delay: 4200,
			disabelOnInteraction: false,
		},
		breakpoints: {
			1025: {
				slidesPerView: 2,
			},
			576: {
				slidesPerView: 1,
			}
		},
		navigation: {
			prevEl: '.product-used-by-projects .product-used-by-projects-nav .lnr-arrow-left',
			nextEl: '.product-used-by-projects .product-used-by-projects-nav .lnr-arrow-right',
		},
		on: {
			init: function () {
				$('.product-used-by-projects .swiper-container .swiper-slide .imgbox').each(function () {
					$(this).height($(this).width() / (400 / 225))
				})
			},
			resize: function () {
				$('.product-used-by-projects .swiper-container .swiper-slide .imgbox').each(function () {
					$(this).height($(this).width() / (400 / 225))
				})
			}
		}
	})
	var ProductOthers = new Swiper('.product-others .swiper-container', {
		slidesPerView: 4,
		spaceBetween: 20,
		loop: true,
		speed: 1200,
		lazy: true,
		autoplay: {
			delay: 3200,
			disabelOnInteraction: false,
		},
		breakpoints: {
			1025: {
				slidesPerView: 3,
			},
			576: {
				slidesPerView: 2,
			}
		},
		navigation: {
			prevEl: '.product-others .product-others-nav .lnr-arrow-left',
			nextEl: '.product-others .product-others-nav .lnr-arrow-right',
		}
	})
	$(".product-detail .product-info .btn-viewmore").on('click', function () {
		$(".product-detail .product-info .full-content").addClass('show')
		$(".product-detail .product-info .btn-wrapper").remove()
	})


	var ProjectImageThumbnailSlider = new Swiper('.project-detail .project-image-thumbnails .swiper-container', {
		spaceBetween: 10,
		slidesPerView: 5,
		loop: true,
		lazy: true,
		// freeMode: true,
		loopedSlides: 5, //looped slides should be the same
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
	})
	var ProjectImageBigSlider = new Swiper('.project-detail .project-image-big .swiper-container', {
		loop: true,
		lazy: true,
		loopedSlides: 5, //looped slides should be the same
		effect: 'fade',
		fadeEffect: {
			crossFade: true,
		},
		thumbs: {
			swiper: ProjectImageThumbnailSlider,
		},
	})
	// ProjectImageBigSlider.controller.control = ProjectImageThumbnailSlider;
	// ProjectImageThumbnailSlider.controller.control = ProjectImageBigSlider;

	$('body').on('click', '.question', function () {
		var questionParent = $(this).parent();
		var questionNextElement = $(this).next();

		if (questionParent.hasClass('active')) {
			questionParent.removeClass('active');
			questionNextElement.slideUp(250);
		} else {
			$('.question').each(function (index, element) {
				$(element).parent().removeClass('active');
				$(element).next().slideUp(250);
			});
			questionParent.addClass('active');
			questionNextElement.slideDown(250);
		}
	});

	// Contact
	$('body').on('click', '.contact-map .item', function () {
		var mapHtml = $(this).children('.map-iframe').html();
		$('#contactMap').html(mapHtml);

		$('.contact-map .item').removeClass('active');
		$(this).addClass('active');
		if ($(window).outerWidth() < 992) {
			$.fancybox.open({
				src: '#contactMap',
				type: "inline",
				opts: {
					baseClass: "contact-map-popup"
				}
			});
		}
	});
	$('.mobile-nav-toggle').on('click', function () {
		$(this).siblings('nav').slideToggle()
	})

	$('body').on('change', '.ajaxsort', function () {
		var pageurl = $(this).val()
		if (pageurl == '/ProductList/ClearUrl') {
			pageurl = window.location.pathname
		}
		$.ajax({
			url: pageurl,
			data: { isajax: true },
			success: function (data) {
				$('.ajaxresponse').replaceWith($(data)[0].outerHTML)
			}
		});

		//to change the browser URL to 'pageurl'
		if (pageurl != window.location) {
			window.history.pushState({ path: pageurl }, '', pageurl);
		}
	})

	$('.btn-register').fancybox({
		parentEl: "form",
	})


});