import { useCallback, useState, useEffect } from "react";
import { httpGetMedia } from "./media.requests";

export const useMedia = () => {
    const [media, setMedia] = useState([]);

    const getMedia = useCallback(async () => {
        const results = await httpGetMedia();
        setMedia(results);
    }, []);

    useEffect(() => {
        getMedia();
    }, [getMedia]);

    return media;
}