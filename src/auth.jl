
abstract Auth

# -------

immutable APIKeyAuth <: Auth
    key
end

function show(io::IO, a::APIKeyAuth)
    key_str =  repeat("*", length(a.key) - 3) * a.key[(end - 2):end]
    print(io, "MapLight API Key ($key_str)")
end

function authentiate_query(query_params, a::APIKeyAuth)
    query_params["apikey"] = a.key
end

# -------

immutable AnonymousAuth <: Auth
end

function show(io::IO, a::AnonymousAuth)
    print(io, "Anonymous MapLight API Auth")
end

function authentiate_query(query_params, a::AnonymousAuth)
    query_params  # nothing to be done
end

# -------

function authenticate(key::String)
    APIKeyAuth(key)
end

function authenticate()
    AnonymousAuth()
end
