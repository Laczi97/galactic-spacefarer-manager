sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/spacefederation/spacefarers/spacefarermanager/test/integration/pages/SpacefarersList",
	"com/spacefederation/spacefarers/spacefarermanager/test/integration/pages/SpacefarersObjectPage"
], function (JourneyRunner, SpacefarersList, SpacefarersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/spacefederation/spacefarers/spacefarermanager') + '/test/flp.html#app-preview',
        pages: {
			onTheSpacefarersList: SpacefarersList,
			onTheSpacefarersObjectPage: SpacefarersObjectPage
        },
        async: true
    });

    return runner;
});

