import {useEffect, useState, useCallback} from 'react';
import {httpGetSocial} from './social.requests';

export const useSocial = () => {
    const [social, setSocial] = useState([]);

    const getSocial = useCallback(async () => {
        const results = await httpGetSocial();
        setSocial(results);
    }, []);

    useEffect(() => {
        getSocial();
    }, [getSocial]);

    return social;
}