export default (srv) => {

    // spacefarer validation
    srv.before('CREATE', 'Spacefarers', async (/**@type Request*/ req) => {

    });

    // send notification email after creating a new Spacefarer
    srv.after('CREATE', 'Spacefarers', async (spacefarer) => {

    });

}