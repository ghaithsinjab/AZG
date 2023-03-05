import { postAPI } from "../../utils/helper.utils";

export const httpSubmitContact = async (contact) => {
    const results = await postAPI('contact-requests', {data: contact}, false);
    return results;
}