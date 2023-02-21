module.exports = ({ env }) => ({
  connection: {
    client: 'mysql',
    connection: {
      host: env('DATABASE_HOST', '127.0.0.1'),
      port: env.int('DATABASE_PORT', 3306),
      database: env('DATABASE_NAME', 'agz_strapi'),
      user: env('DATABASE_USERNAME', 'agz_usr'),
      password: env('DATABASE_PASSWORD', 'Y&3T%sX9p2XF'),
      ssl: env.bool('DATABASE_SSL', false),
    },
  },
});
