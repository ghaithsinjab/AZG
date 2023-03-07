import {useEffect, useState, useCallback} from 'react';

import { httpGetServiceId, httpGetServiceItem, httpGetServices } from './services.requests';

export const useServices = () => {
    const [services, setServices] = useState([]);

    const getServices = useCallback(async () => {
        const results = await httpGetServices();
        setServices(results);
    }, []);

    useEffect(() => {
        getServices();
    }, [getServices]);

    return services;
}

export const useServiceDetails = (url) => {
    const [service, setService] = useState(null);
    const [serviceId, setServiceId] = useState(0);

    const getServiceId = useCallback(async (url) => {
        const result = await httpGetServiceId(url);
        setServiceId(result);
    }, []);

    const getServiceDetails = useCallback(async (id) => {
        const results = await httpGetServiceItem(id);
        setService(results);
    }, []);

    useEffect(() => {
        getServiceId(url);
    }, [getServiceId, url]);

    useEffect(() => {
        serviceId && getServiceDetails(serviceId);
    }, [getServiceDetails, serviceId]);

    return service;
}