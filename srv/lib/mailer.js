let _transporter = null;

const getTransporter = async () => {
    if (_transporter) return _transporter;
    const nodemailer = await import('nodemailer');
    const testAccount = await nodemailer.default.createTestAccount();
    _transporter = nodemailer.default.createTransport({
        host: 'smtp.ethereal.email',
        port: 587,
        auth: { user: testAccount.user, pass: testAccount.pass },
    });
    console.log(`[Email] account ready: ${testAccount.user}`);
    return _transporter;
};

export const sendWelcomeEmail = async (spacefarer) => {
    const nodemailer = await import('nodemailer');
    const transporter = await getTransporter();
    const info = await transporter.sendMail({
        from: '"Space Federation HQ" <hq@spacefederation.com>',
        to: spacefarer.email,
        subject: 'Congratulations, Spacefarer!',
        text: `Dear ${spacefarer.name},\n\nCongratulations on starting your adventurous journey among the stars!\nThe cosmos awaits you.\n\n— Space Federation HQ`,
        html: `<p>Dear <strong>${spacefarer.name}</strong>,</p><p>Congratulations on starting your adventurous journey among the stars!<br>The cosmos awaits you.</p><p>— Space Federation HQ</p>`,
    });
    console.log(`[Email] Sent to ${spacefarer.email} — preview: ${nodemailer.default.getTestMessageUrl(info)}`);
};
