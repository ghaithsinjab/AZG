module.exports = {
  email: {
    config: {
      provider: "strapi-provider-email-postmark",
      providerOptions: {
        apiKey: "8753573c-1e77-4d5e-8e8f-472066b25ab6",
      },
      settings: {
        defaultMessageStream: "outbound",
      },
    },
  },
};
