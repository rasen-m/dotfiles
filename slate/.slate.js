S.configAll({
  'defaultToCurrentScreen' : true,
  'secondsBetweenRepeat' : 0.1,
  'checkDefaultsOnLoad' : true,
  'focusCheckWidthMax' : 3000,
  'orderScreensLeftToRight' : true
});

var windowToTopHalf = S.operation('push', {
	'direction': 'top',
	'style': 'bar-resize: screenSizeY/2'
});

var windowToFullScreen = S.operation('push', {
	'direction': 'top',
	'style': 'bar-resize: screenSizeY'
});

var windowToBottomHalf = S.operation('push', {
	'direction': 'bottom',
	'style': 'bar-resize: screenSizeY/2'
});

var windowToLeftHalf = S.operation('push', {
	'direction': 'left',
	'style': 'bar-resize: screenSizeX/2'
});

var windowToLeftScreenRightHalf = S.operation('push', {
	'direction': 'right',
	'style': 'bar-resize: screenSizeX/2',
	'screen': 0
});

var windowToRightHalf = S.operation('push', {
	'direction': 'right',
	'style': 'bar-resize: screenSizeX/2'
});

var windowToRightScreenLeftHalf = S.operation('push', {
	'direction': 'left',
	'style': 'bar-resize: screenSizeX/2',
	'screen': 1
});

var windowToLeftThird = S.operation('push', {
	'direction': 'left',
	'style': 'bar-resize: screenSizeX/3',
});

var windowToMiddleThird = S.operation('move', {
	'x' : 'screenOriginX+(screenSizeX/3)',
  'y' : 'screenOriginY',
	'width' : 'screenSizeX/3',
  'height' : 'screenSizeY',
});

var windowToRightThird = S.operation('push', {
	'direction': 'right',
	'style': 'bar-resize: screenSizeX/3',
});

S.bindAll({
	'up:ctrl': function (window) {
		var oldWindowRect = window.rect();
		window.doOperation(windowToTopHalf);
		var newWindowRect = window.rect();

		if (_.isEqual(oldWindowRect, newWindowRect)) {
			window.doOperation(windowToFullScreen);
		}
	},
	'right:ctrl': function (window) {
		var oldWindowRect = window.rect();
		window.doOperation(windowToRightHalf);
		var newWindowRect = window.rect();

		if (_.isEqual(oldWindowRect, newWindowRect) && (window.screen().id() == 0)) {
			window.doOperation(windowToRightScreenLeftHalf);
		}
	},
	'down:ctrl': windowToBottomHalf,
	'left:ctrl': function (window) {
		var oldWindowRect = window.rect();
		window.doOperation(windowToLeftHalf);
		var newWindowRect = window.rect();

		if (_.isEqual(oldWindowRect, newWindowRect) && (window.screen().id() == 1)) {
			window.doOperation(windowToLeftScreenRightHalf);
		}
	},
	'1:ctrl': windowToLeftThird,
	'2:ctrl': windowToMiddleThird,
	'3:ctrl': windowToRightThird,
});
