import { useCallback, useState, useEffect } from "react";
import { httpGetMedia, httpGetMediaId, httpGetMediaItem } from "./media.requests";

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

export const useMediaDetails = (url) => {
    const [media, setMedia] = useState(null);
    const [mediaId, setMediaId] = useState(0);

    const getMediaId = useCallback(async (url) => {
        const result = await httpGetMediaId(url);
        setMediaId(result);
    }, []);

    const getMediaDetails = useCallback(async (id) => {
        const results = await httpGetMediaItem(id);
        setMedia(results);
    }, []);

    useEffect(() => {
        getMediaId(url);
    }, [getMediaId, url]);

    useEffect(() => {
        mediaId && getMediaDetails(mediaId);
    }, [getMediaDetails, mediaId]);

    return media;
}