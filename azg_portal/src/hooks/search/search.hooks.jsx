import { useCallback, useEffect, useState } from 'react';

import { httpGetSearchPage, httpGetSearch } from './search.requests';

export const useSearchPage = () => {
    const [searchPage, setSearchPage] = useState({});

    const getSearchPage = useCallback(async () => {
        const results = await httpGetSearchPage();
        setSearchPage(results);
    }, []);

    useEffect(() => {
        getSearchPage();
    }, [getSearchPage]);

    return searchPage;
}

export const useSearch = (searchTerm) => {
    const [search, setSearch] = useState([]);

    const getSearch = useCallback(async (q) => {
        const results = await httpGetSearch(q);
        setSearch(results);
    }, []);

    useEffect(() => {
        getSearch(searchTerm);
    }, [searchTerm, getSearch]);

    return search;
}