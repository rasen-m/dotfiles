var global = {
	menuBarHeight: 23,
	threshold: 5,
	yieldApps: [
		'Terminal',
	],
};

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

S.bindAll({
	'up:ctrl': function (windowObject) {
		var windowRect = windowObject.rect();
		var screenRect = windowObject.screen().rect();
		var yield = _.contains(global.yieldApps, windowObject.app().name());

		if (isAtTopHalfOfScreen(windowRect, screenRect, yield)) {
			windowObject.doOperation(windowToFullScreen);
		} else {
			windowObject.doOperation(windowToTopHalf);
		}
	},
	'right:ctrl': function (windowObject) {
		var windowRect = windowObject.rect();
		var screenRect = windowObject.screen().rect();
		var yield = _.contains(global.yieldApps, windowObject.app().name());

		if (isAtRightHalfOfScreen(windowRect, screenRect, yield)) {
			windowObject.doOperation(windowToRightScreenLeftHalf);
		} else {
			windowObject.doOperation(windowToRightHalf);
		}
	},
	'down:ctrl': windowToBottomHalf,
	'left:ctrl': function (windowObject) {
		var windowRect = windowObject.rect();
		var screenRect = windowObject.screen().rect();
		var yield = _.contains(global.yieldApps, windowObject.app().name());

		if (isAtLeftHalfOfScreen(windowRect, screenRect, yield)) {
			windowObject.doOperation(windowToLeftScreenRightHalf);
		} else {
			windowObject.doOperation(windowToLeftHalf);
		}
	},
});

function isEqual(i, j, yield) {
	finetune = yield ? 3 : 1;

	return (global.threshold * finetune) >= Math.abs(i - j);
}

function isAtTopHalfOfScreen(windowRect, screenRect, yield) {
	var compensatedScreenY = screenRect.y + global.menuBarHeight;
	var compensatedScreenHeight = screenRect.height - global.menuBarHeight;

	return isEqual(screenRect.x, windowRect.x, yield) 
	&& isEqual(compensatedScreenY, windowRect.y, yield) 
	&& isEqual(compensatedScreenHeight / 2, windowRect.height, yield) 
	&& isEqual(screenRect.width, windowRect.width, yield);
}

function isAtRightHalfOfScreen(windowRect, screenRect, yield) {
	var compensatedScreenY = screenRect.y + global.menuBarHeight;
	var compensatedScreenHeight = screenRect.height - global.menuBarHeight;

	return isEqual(screenRect.x + (screenRect.width / 2), windowRect.x, yield) 
	&& isEqual(compensatedScreenY, windowRect.y, yield) 
	&& isEqual(compensatedScreenHeight, windowRect.height, yield) 
	&& isEqual(screenRect.width / 2, windowRect.width, yield);
}

function isAtRightThirdOfScreen(windowRect, screenRect, yield) {
	var compensatedScreenY = screenRect.y + global.menuBarHeight;
	var compensatedScreenHeight = screenRect.height - global.menuBarHeight;

	return isEqual(screenRect.x + ((screenRect.width / 3) * 2), windowRect.x, yield) 
	&& isEqual(compensatedScreenY, windowRect.y, yield) 
	&& isEqual(compensatedScreenHeight, windowRect.height, yield) 
	&& isEqual(screenRect.width / 3, windowRect.width, yield);
}

function isAtLeftHalfOfScreen(windowRect, screenRect, yield) {
	var compensatedScreenY = screenRect.y + global.menuBarHeight;
	var compensatedScreenHeight = screenRect.height - global.menuBarHeight;

	return isEqual(screenRect.x, windowRect.x, yield) 
	&& isEqual(compensatedScreenY, windowRect.y, yield) 
	&& isEqual(compensatedScreenHeight, windowRect.height, yield) 
	&& isEqual(screenRect.width / 2, windowRect.width, yield);
}
