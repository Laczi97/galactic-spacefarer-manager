export default (srv) => {

    // clear position when department changes in draft
    srv.before('PATCH', 'Spacefarers.drafts', (/**@type Request*/ req) => {
        if ('department_ID' in req.data) {
            req.data.position_ID = null;
        }
    });

    // spacefarer validation
    srv.before('CREATE', 'Spacefarers', async (/**@type Request*/ req) => {
        const { data } = req;

        if (data.stardustCollection < 0) {
            return req.error(400, 'Stardust collection cannot be negative');
        }

        if (data.wormholeNavigationSkill < 0) {
            return req.error(400, 'Wormhole navigation skill cannot be negative');
        }
    });

    // send notification email after creating a new Spacefarer
    srv.after('CREATE', 'Spacefarers', async (spacefarer) => {

    });

}