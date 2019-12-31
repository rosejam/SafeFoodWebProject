import axios from "axios";

export default axios.create({
    baseURL: "http://70.12.108.207:9000",
    headers: {
        "Content-type": "application/json",
    }
});