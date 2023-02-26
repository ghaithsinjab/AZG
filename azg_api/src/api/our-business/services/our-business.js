'use strict';

/**
 * our-business service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::our-business.our-business');
