import {useEffect, useState, useCallback} from 'react';
import { httpGetServices } from './services.requests';

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