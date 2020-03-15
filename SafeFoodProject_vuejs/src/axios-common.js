import axios from "axios";

export default axios.create({
    baseURL: "http://15.165.69.172:81/SafeFood",
    //baseURL: "http://localhost:8080/safefood",
    headers: {
        "Content-type": "application/json",
    }
});