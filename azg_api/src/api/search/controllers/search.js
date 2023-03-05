const { sanitize } = require("@strapi/utils");
const { contentAPI } = sanitize;

module.exports = {
  async search(ctx) {
    const { q } = ctx.query;

    //search services
    const services = await strapi.entityService.findMany(
      "api::service.service",
      {
        filters: {
          $and: [
            {
              title: {
                $contains: q,
              },
            },
          ],
        },
        populate: ["image"],
      }
    );

    //search media
    const media = await strapi.entityService.findMany(
      "api::media-item.media-item",
      {
        filters: {
          $and: [
            {
              title: {
                $contains: q,
              },
            },
          ],
        },
        populate: ["image"],
      }
    );

    const servicesSanitized = services.map(
      ({ id, title, url, createdAt, image }) => ({
        id,
        title,
        url,
        createdAt,
        image,
        type: "Services",
      })
    );
    const mediaSanitized = media.map(
      ({ id, title, url, createdAt, image }) => ({
        id,
        title,
        url,
        createdAt,
        image,
        type: "Media",
      })
    );

    const results = [...servicesSanitized, ...mediaSanitized];

    const contentType = strapi.contentType("api::search.search");

    return await contentAPI.output(
      results.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt)),
      contentType,
      ctx.state.auth
    );
  },
};
