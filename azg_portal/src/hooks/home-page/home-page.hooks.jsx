import {useEffect, useState, useCallback} from 'react';
import { httpGetHomePage } from './home-page.requests';

export const useHomePage = () => {
    const [homePage, setHomePage] = useState({});

    const getHomePage = useCallback(async () => {
        const results = await httpGetHomePage();
        setHomePage(results);
    }, []);

    useEffect(() => {
        getHomePage();
    }, [getHomePage]);

    return homePage;
}