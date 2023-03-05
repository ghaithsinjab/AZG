const utils = require("@strapi/utils");
const axios = require("axios");

const { UnauthorizedError } = utils.errors;

module.exports = {
  async beforeCreate(event) {
    const { data } = event.params;
    const token = data.captcha || "";
    if (token !== "") {
      const privateKey = process.env.CAPTCHA;
      const response = await axios.post(
        `https://www.google.com/recaptcha/api/siteverify?secret=${privateKey}&response=${token}`
      );
      if (!response.data.success)
        throw new UnauthorizedError(`Couldn't verify captcha!`);
    } else throw new UnauthorizedError(`Invalid captcha!`);
  },

  async afterCreate(event) {
    const { result } = event;
    try {
      await strapi.plugins["email"].services.email.send({
        to: process.env.EMAIL_ADDRESS,
        from: "info@azg.ae",
        replyTo: result.email,
        subject: "New career request",
        text: "new career request received from website!",
        html: `
          Dear Admin,<br /><br />
          You have received a new career request via <strong>AZG</strong> website with the following information:<br /><br />
          <strong>Title:</strong>&nbsp;${result.title}<br />
          <strong>First Name:</strong>&nbsp;${result.first_name}<br />
          <strong>Last Name:</strong>&nbsp;${result.last_name}<br />
          <strong>Email:</strong>&nbsp;${result.email}<br />
          <strong>Contact:</strong>&nbsp;${result.contact}<br />
          <strong>Job Title:</strong>&nbsp;${result.job_title}<br />
          <strong>Cover Letter:</strong>&nbsp;${result.cover_letter}<br /><br />
          <small>Please note that you can contact the sender by replying to this email.</small>
        `,
        tag: "AZG",
      });
    } catch (err) {
      console.log(err);
    }
  },
};
