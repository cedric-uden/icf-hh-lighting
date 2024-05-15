--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value) == nil)
end

local function __TS__ArrayConcat(self, ...)
    local items = {...}
    local result = {}
    local len = 0
    for i = 1, #self do
        len = len + 1
        result[len] = self[i]
    end
    for i = 1, #items do
        local item = items[i]
        if __TS__ArrayIsArray(item) then
            for j = 1, #item do
                len = len + 1
                result[len] = item[j]
            end
        else
            len = len + 1
            result[len] = item
        end
    end
    return result
end

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

local function __TS__ArrayEvery(self, callbackfn, thisArg)
    for i = 1, #self do
        if not callbackfn(thisArg, self[i], i - 1, self) then
            return false
        end
    end
    return true
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local function __TS__ArrayFind(self, predicate, thisArg)
    for i = 1, #self do
        local elem = self[i]
        if predicate(thisArg, elem, i - 1, self) then
            return elem
        end
    end
    return nil
end

local function __TS__ArrayFindIndex(self, callbackFn, thisArg)
    for i = 1, #self do
        if callbackFn(thisArg, self[i], i - 1, self) then
            return i - 1
        end
    end
    return -1
end

local __TS__Iterator
do
    local function iteratorGeneratorStep(self)
        local co = self.____coroutine
        local status, value = coroutine.resume(co)
        if not status then
            error(value, 0)
        end
        if coroutine.status(co) == "dead" then
            return
        end
        return true, value
    end
    local function iteratorIteratorStep(self)
        local result = self:next()
        if result.done then
            return
        end
        return true, result.value
    end
    local function iteratorStringStep(self, index)
        index = index + 1
        if index > #self then
            return
        end
        return index, string.sub(self, index, index)
    end
    function __TS__Iterator(iterable)
        if type(iterable) == "string" then
            return iteratorStringStep, iterable, 0
        elseif iterable.____coroutine ~= nil then
            return iteratorGeneratorStep, iterable
        elseif iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return iteratorIteratorStep, iterator
        else
            return ipairs(iterable)
        end
    end
end

local __TS__ArrayFrom
do
    local function arrayLikeStep(self, index)
        index = index + 1
        if index > self.length then
            return
        end
        return index, self[index]
    end
    local function arrayLikeIterator(arr)
        if type(arr.length) == "number" then
            return arrayLikeStep, arr, 0
        end
        return __TS__Iterator(arr)
    end
    function __TS__ArrayFrom(arrayLike, mapFn, thisArg)
        local result = {}
        if mapFn == nil then
            for ____, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = v
            end
        else
            for i, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = mapFn(thisArg, v, i - 1)
            end
        end
        return result
    end
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k + 1, len do
        if self[i] == searchElement then
            return true
        end
    end
    return false
end

local function __TS__ArrayIndexOf(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    if len == 0 then
        return -1
    end
    if fromIndex >= len then
        return -1
    end
    if fromIndex < 0 then
        fromIndex = len + fromIndex
        if fromIndex < 0 then
            fromIndex = 0
        end
    end
    for i = fromIndex + 1, len do
        if self[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

local function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local parts = {}
    for i = 1, #self do
        parts[i] = tostring(self[i])
    end
    return table.concat(parts, separator)
end

local function __TS__ArrayMap(self, callbackfn, thisArg)
    local result = {}
    for i = 1, #self do
        result[i] = callbackfn(thisArg, self[i], i - 1, self)
    end
    return result
end

local function __TS__ArrayPush(self, ...)
    local items = {...}
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__ArrayPushArray(self, items)
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__ArrayReduce(self, callbackFn, ...)
    local len = #self
    local k = 0
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, len do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReduceRight(self, callbackFn, ...)
    local len = #self
    local k = len - 1
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, 1, -1 do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReverse(self)
    local i = 1
    local j = #self
    while i < j do
        local temp = self[j]
        self[j] = self[i]
        self[i] = temp
        i = i + 1
        j = j - 1
    end
    return self
end

local function __TS__ArrayUnshift(self, ...)
    local items = {...}
    local numItemsToInsert = #items
    if numItemsToInsert == 0 then
        return #self
    end
    for i = #self, 1, -1 do
        self[i + numItemsToInsert] = self[i]
    end
    for i = 1, numItemsToInsert do
        self[i] = items[i]
    end
    return #self
end

local function __TS__ArraySort(self, compareFn)
    if compareFn ~= nil then
        table.sort(
            self,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(self)
    end
    return self
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    local ____first_0 = first
    if ____first_0 == nil then
        ____first_0 = 0
    end
    first = ____first_0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    local ____last_1 = last
    if ____last_1 == nil then
        ____last_1 = len
    end
    last = ____last_1
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local function __TS__ArraySome(self, callbackfn, thisArg)
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            return true
        end
    end
    return false
end

local function __TS__ArraySplice(self, ...)
    local args = {...}
    local len = #self
    local actualArgumentCount = __TS__CountVarargs(...)
    local start = args[1]
    local deleteCount = args[2]
    if start < 0 then
        start = len + start
        if start < 0 then
            start = 0
        end
    elseif start > len then
        start = len
    end
    local itemCount = actualArgumentCount - 2
    if itemCount < 0 then
        itemCount = 0
    end
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - start
    else
        local ____deleteCount_0 = deleteCount
        if ____deleteCount_0 == nil then
            ____deleteCount_0 = 0
        end
        actualDeleteCount = ____deleteCount_0
        if actualDeleteCount < 0 then
            actualDeleteCount = 0
        end
        if actualDeleteCount > len - start then
            actualDeleteCount = len - start
        end
    end
    local out = {}
    for k = 1, actualDeleteCount do
        local from = start + k
        if self[from] ~= nil then
            out[k] = self[from]
        end
    end
    if itemCount < actualDeleteCount then
        for k = start + 1, len - actualDeleteCount do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
        for k = len - actualDeleteCount + itemCount + 1, len do
            self[k] = nil
        end
    elseif itemCount > actualDeleteCount then
        for k = len - actualDeleteCount, start + 1, -1 do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
    end
    local j = start + 1
    for i = 3, actualArgumentCount do
        self[j] = args[i]
        j = j + 1
    end
    for k = #self, len - actualDeleteCount + itemCount + 1, -1 do
        self[k] = nil
    end
    return out
end

local function __TS__ArrayToObject(self)
    local object = {}
    for i = 1, #self do
        object[i - 1] = self[i]
    end
    return object
end

local function __TS__ArrayFlat(self, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = self[i]
        if depth > 0 and __TS__ArrayIsArray(value) then
            local toAdd
            if depth == 1 then
                toAdd = value
            else
                toAdd = __TS__ArrayFlat(value, depth - 1)
            end
            for j = 1, #toAdd do
                local val = toAdd[j]
                len = len + 1
                result[len] = val
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArrayFlatMap(self, callback, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = callback(thisArg, self[i], i - 1, self)
        if __TS__ArrayIsArray(value) then
            for j = 1, #value do
                len = len + 1
                result[len] = value[j]
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArraySetLength(self, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    for i = length + 1, #self do
        self[i] = nil
    end
    return length
end

local function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local __TS__Unpack = table.unpack or unpack

local function __TS__FunctionBind(fn, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        __TS__ArrayUnshift(
            args,
            __TS__Unpack(boundArgs)
        )
        return fn(__TS__Unpack(args))
    end
end

local __TS__Promise
do
    local function promiseDeferred(self)
        local resolve
        local reject
        local promise = __TS__New(
            __TS__Promise,
            function(____, res, rej)
                resolve = res
                reject = rej
            end
        )
        return {promise = promise, resolve = resolve, reject = reject}
    end
    local function isPromiseLike(self, thing)
        return __TS__InstanceOf(thing, __TS__Promise)
    end
    __TS__Promise = __TS__Class()
    __TS__Promise.name = "__TS__Promise"
    function __TS__Promise.prototype.____constructor(self, executor)
        self.state = 0
        self.fulfilledCallbacks = {}
        self.rejectedCallbacks = {}
        self.finallyCallbacks = {}
        do
            local function ____catch(e)
                self:reject(e)
            end
            local ____try, ____hasReturned = pcall(function()
                executor(
                    nil,
                    __TS__FunctionBind(self.resolve, self),
                    __TS__FunctionBind(self.reject, self)
                )
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    function __TS__Promise.resolve(data)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 1
        promise.value = data
        return promise
    end
    function __TS__Promise.reject(reason)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 2
        promise.rejectionReason = reason
        return promise
    end
    __TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
        local ____promiseDeferred_result_0 = promiseDeferred(nil)
        local promise = ____promiseDeferred_result_0.promise
        local resolve = ____promiseDeferred_result_0.resolve
        local reject = ____promiseDeferred_result_0.reject
        local isFulfilled = self.state == 1
        local isRejected = self.state == 2
        if onFulfilled then
            local internalCallback = self:createPromiseResolvingCallback(onFulfilled, resolve, reject)
            local ____self_fulfilledCallbacks_1 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_1[#____self_fulfilledCallbacks_1 + 1] = internalCallback
            if isFulfilled then
                internalCallback(nil, self.value)
            end
        else
            local ____self_fulfilledCallbacks_2 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_2[#____self_fulfilledCallbacks_2 + 1] = function(____, v) return resolve(nil, v) end
        end
        if onRejected then
            local internalCallback = self:createPromiseResolvingCallback(onRejected, resolve, reject)
            local ____self_rejectedCallbacks_3 = self.rejectedCallbacks
            ____self_rejectedCallbacks_3[#____self_rejectedCallbacks_3 + 1] = internalCallback
            if isRejected then
                internalCallback(nil, self.rejectionReason)
            end
        else
            local ____self_rejectedCallbacks_4 = self.rejectedCallbacks
            ____self_rejectedCallbacks_4[#____self_rejectedCallbacks_4 + 1] = function(____, err) return reject(nil, err) end
        end
        if isFulfilled then
            resolve(nil, self.value)
        end
        if isRejected then
            reject(nil, self.rejectionReason)
        end
        return promise
    end
    function __TS__Promise.prototype.catch(self, onRejected)
        return self["then"](self, nil, onRejected)
    end
    function __TS__Promise.prototype.finally(self, onFinally)
        if onFinally then
            local ____self_finallyCallbacks_5 = self.finallyCallbacks
            ____self_finallyCallbacks_5[#____self_finallyCallbacks_5 + 1] = onFinally
            if self.state ~= 0 then
                onFinally(nil)
            end
        end
        return self
    end
    function __TS__Promise.prototype.resolve(self, data)
        if __TS__InstanceOf(data, __TS__Promise) then
            data["then"](
                data,
                function(____, v) return self:resolve(v) end,
                function(____, err) return self:reject(err) end
            )
            return
        end
        if self.state == 0 then
            self.state = 1
            self.value = data
            for ____, callback in ipairs(self.fulfilledCallbacks) do
                callback(nil, data)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.reject(self, reason)
        if self.state == 0 then
            self.state = 2
            self.rejectionReason = reason
            for ____, callback in ipairs(self.rejectedCallbacks) do
                callback(nil, reason)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
        return function(____, value)
            do
                local function ____catch(e)
                    reject(nil, e)
                end
                local ____try, ____hasReturned = pcall(function()
                    self:handleCallbackData(
                        f(nil, value),
                        resolve,
                        reject
                    )
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    end
    function __TS__Promise.prototype.handleCallbackData(self, data, resolve, reject)
        if isPromiseLike(nil, data) then
            local nextpromise = data
            if nextpromise.state == 1 then
                resolve(nil, nextpromise.value)
            elseif nextpromise.state == 2 then
                reject(nil, nextpromise.rejectionReason)
            else
                data["then"](data, resolve, reject)
            end
        else
            resolve(nil, data)
        end
    end
end

local function __TS__AsyncAwaiter(generator)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            local adopt, fulfilled, step, resolved, asyncCoroutine
            function adopt(self, value)
                local ____temp_0
                if __TS__InstanceOf(value, __TS__Promise) then
                    ____temp_0 = value
                else
                    ____temp_0 = __TS__Promise.resolve(value)
                end
                return ____temp_0
            end
            function fulfilled(self, value)
                local success, resultOrError = coroutine.resume(asyncCoroutine, value)
                if success then
                    step(nil, resultOrError)
                else
                    reject(nil, resultOrError)
                end
            end
            function step(self, result)
                if resolved then
                    return
                end
                if coroutine.status(asyncCoroutine) == "dead" then
                    resolve(nil, result)
                else
                    local ____self_1 = adopt(nil, result)
                    ____self_1["then"](____self_1, fulfilled, reject)
                end
            end
            resolved = false
            asyncCoroutine = coroutine.create(generator)
            local success, resultOrError = coroutine.resume(
                asyncCoroutine,
                function(____, v)
                    resolved = true
                    local ____self_2 = adopt(nil, v)
                    ____self_2["then"](____self_2, resolve, reject)
                end
            )
            if success then
                step(nil, resultOrError)
            else
                reject(nil, resultOrError)
            end
        end
    )
end
local function __TS__Await(thing)
    return coroutine.yield(thing)
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local function __TS__CloneDescriptor(____bindingPattern0)
    local value
    local writable
    local set
    local get
    local configurable
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    configurable = ____bindingPattern0.configurable
    get = ____bindingPattern0.get
    set = ____bindingPattern0.set
    writable = ____bindingPattern0.writable
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = get ~= nil or set ~= nil
    local hasValueOrWritableAttribute = writable ~= nil or value ~= nil
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end

local function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

local __TS__SetDescriptor
do
    local function descriptorIndex(self, key)
        local value = rawget(self, key)
        if value ~= nil then
            return value
        end
        local metatable = getmetatable(self)
        while metatable do
            local rawResult = rawget(metatable, key)
            if rawResult ~= nil then
                return rawResult
            end
            local descriptors = rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor then
                    if descriptor.get then
                        return descriptor.get(self)
                    end
                    return descriptor.value
                end
            end
            metatable = getmetatable(metatable)
        end
    end
    local function descriptorNewIndex(self, key, value)
        local metatable = getmetatable(self)
        while metatable do
            local descriptors = rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor then
                    if descriptor.set then
                        descriptor.set(self, value)
                    else
                        if descriptor.writable == false then
                            error(
                                ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                                0
                            )
                        end
                        descriptor.value = value
                    end
                    return
                end
            end
            metatable = getmetatable(metatable)
        end
        rawset(self, key, value)
    end
    function __TS__SetDescriptor(target, key, desc, isPrototype)
        if isPrototype == nil then
            isPrototype = false
        end
        local ____isPrototype_0
        if isPrototype then
            ____isPrototype_0 = target
        else
            ____isPrototype_0 = getmetatable(target)
        end
        local metatable = ____isPrototype_0
        if not metatable then
            metatable = {}
            setmetatable(target, metatable)
        end
        local value = rawget(target, key)
        if value ~= nil then
            rawset(target, key, nil)
        end
        if not rawget(metatable, "_descriptors") then
            metatable._descriptors = {}
        end
        local descriptor = __TS__CloneDescriptor(desc)
        metatable._descriptors[key] = descriptor
        metatable.__index = descriptorIndex
        metatable.__newindex = descriptorNewIndex
    end
end

local function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(nil, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(nil, target, key, descriptor) or descriptor
                    local isSimpleValue = desc.configurable == true and desc.writable == true and not desc.get and not desc.set
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(nil, target, key, desc)
                else
                    result = decorator(nil, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(nil, target, key, paramIndex) end
end

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0") or _VERSION == "Lua 5.1"
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (tostring(description) .. "\n") .. self.stack
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_2 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        local ____temp_1
        if self.message ~= "" then
            ____temp_1 = (self.name .. ": ") .. self.message
        else
            ____temp_1 = self.name
        end
        return ____temp_1
    end
    Error = ____initErrorClass_2(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_4 = initErrorClass
        local ____class_3 = __TS__Class()
        ____class_3.name = ____class_3.name
        __TS__ClassExtends(____class_3, Error)
        function ____class_3.prototype.____constructor(self, ...)
            ____class_3.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_4(nil, ____class_3, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

local function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

local function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(__TS__StringAccess(iterable, index))
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

local __TS__Generator
do
    local function generatorIterator(self)
        return self
    end
    local function generatorNext(self, ...)
        local co = self.____coroutine
        if coroutine.status(co) == "dead" then
            return {done = true}
        end
        local status, value = coroutine.resume(co, ...)
        if not status then
            error(value, 0)
        end
        return {
            value = value,
            done = coroutine.status(co) == "dead"
        }
    end
    function __TS__Generator(fn)
        return function(...)
            local args = {...}
            local argsLength = __TS__CountVarargs(...)
            return {
                ____coroutine = coroutine.create(function() return fn(__TS__Unpack(args, 1, argsLength)) end),
                [Symbol.iterator] = generatorIterator,
                next = generatorNext
            }
        end
    end
end

local function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

local function __TS__LuaIteratorSpread(self, state, firstKey)
    local results = {}
    local key, value = self(state, firstKey)
    while key do
        results[#results + 1] = {key, value}
        key, value = self(state, key)
    end
    return __TS__Unpack(results)
end

local Map
do
    Map = __TS__Class()
    Map.name = "Map"
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            for ____, kvp in ipairs(array) do
                self:set(kvp[1], kvp[2])
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[key]
            local previous = self.previousKey[key]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[key] = nil
            self.previousKey[key] = nil
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return self.nextKey[key] ~= nil or self.lastKey == key
    end
    function Map.prototype.set(self, key, value)
        local isNewValue = not self:has(key)
        if isNewValue then
            self.size = self.size + 1
        end
        self.items[key] = value
        if self.firstKey == nil then
            self.firstKey = key
            self.lastKey = key
        elseif isNewValue then
            self.nextKey[self.lastKey] = key
            self.previousKey[key] = self.lastKey
            self.lastKey = key
        end
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, items[key]}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.values(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = items[key]}
                key = nextKey[key]
                return result
            end
        }
    end
    Map[Symbol.species] = Map
end

local __TS__Match = string.match

local __TS__MathAtan2 = math.atan2 or math.atan

local __TS__MathModf = math.modf

local function __TS__MathSign(val)
    if val > 0 then
        return 1
    elseif val < 0 then
        return -1
    end
    return 0
end

local function __TS__Modulo50(a, b)
    return a - math.floor(a / b) * b
end

local function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return value and 1 or 0
    else
        return 0 / 0
    end
end

local function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local function __TS__NumberIsNaN(value)
    return value ~= value
end

local __TS__NumberToString
do
    local radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
    function __TS__NumberToString(self, radix)
        if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
            return tostring(self)
        end
        radix = math.floor(radix)
        if radix < 2 or radix > 36 then
            error("toString() radix argument must be between 2 and 36", 0)
        end
        local integer, fraction = __TS__MathModf(math.abs(self))
        local result = ""
        if radix == 8 then
            result = string.format("%o", integer)
        elseif radix == 16 then
            result = string.format("%x", integer)
        else
            repeat
                do
                    result = __TS__StringAccess(radixChars, integer % radix) .. result
                    integer = math.floor(integer / radix)
                end
            until not (integer ~= 0)
        end
        if fraction ~= 0 then
            result = result .. "."
            local delta = 1e-16
            repeat
                do
                    fraction = fraction * radix
                    delta = delta * radix
                    local digit = math.floor(fraction)
                    result = result .. __TS__StringAccess(radixChars, digit)
                    fraction = fraction - digit
                end
            until not (fraction >= delta)
        end
        if self < 0 then
            result = "-" .. result
        end
        return result
    end
end

local function __TS__ObjectDefineProperty(target, key, desc)
    local ____temp_0
    if type(key) == "number" then
        ____temp_0 = key + 1
    else
        ____temp_0 = key
    end
    local luaKey = ____temp_0
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = desc.get ~= nil or desc.set ~= nil
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        local ____desc_set_5 = desc.set
        local ____desc_get_6 = desc.get
        local ____temp_1
        if desc.configurable ~= nil then
            ____temp_1 = desc.configurable
        else
            ____temp_1 = valueExists
        end
        local ____temp_2
        if desc.enumerable ~= nil then
            ____temp_2 = desc.enumerable
        else
            ____temp_2 = valueExists
        end
        local ____temp_3
        if desc.writable ~= nil then
            ____temp_3 = desc.writable
        else
            ____temp_3 = valueExists
        end
        local ____temp_4
        if desc.value ~= nil then
            ____temp_4 = desc.value
        else
            ____temp_4 = value
        end
        descriptor = {
            set = ____desc_set_5,
            get = ____desc_get_6,
            configurable = ____temp_1,
            enumerable = ____temp_2,
            writable = ____temp_3,
            value = ____temp_4
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

local function __TS__ObjectEntries(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = {key, obj[key]}
    end
    return result
end

local function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

local function __TS__ObjectValues(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = obj[key]
    end
    return result
end

local function __TS__ParseFloat(numberString)
    local infinityMatch = __TS__Match(numberString, "^%s*(-?Infinity)")
    if infinityMatch then
        local ____temp_0
        if __TS__StringAccess(infinityMatch, 0) == "-" then
            ____temp_0 = -math.huge
        else
            ____temp_0 = math.huge
        end
        return ____temp_0
    end
    local number = tonumber(__TS__Match(numberString, "^%s*(-?%d+%.?%d*)"))
    local ____number_1 = number
    if ____number_1 == nil then
        ____number_1 = 0 / 0
    end
    return ____number_1
end

local function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if length ~= length or length <= 0 then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

local function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = __TS__Match(numberString, "^%s*-?0[xX]")
            if hexMatch then
                base = 16
                local ____TS__Match_result__0_0
                if __TS__Match(hexMatch, "-") then
                    ____TS__Match_result__0_0 = "-" .. __TS__StringSubstr(numberString, #hexMatch)
                else
                    ____TS__Match_result__0_0 = __TS__StringSubstr(numberString, #hexMatch)
                end
                numberString = ____TS__Match_result__0_0
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local ____temp_1
        if base <= 10 then
            ____temp_1 = __TS__StringSubstring(parseIntBasePattern, 0, base)
        else
            ____temp_1 = __TS__StringSubstr(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        end
        local allowedDigits = ____temp_1
        local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
        local number = tonumber(
            __TS__Match(numberString, pattern),
            base
        )
        if number == nil then
            return 0 / 0
        end
        if number >= 0 then
            return math.floor(number)
        else
            return math.ceil(number)
        end
    end
end

local function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = item.value
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = item
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = data
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        reject(nil, reason)
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == 2 then
                results[i + 1] = {status = "rejected", reason = item.rejectionReason}
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = {status = "fulfilled", value = item}
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = {status = "fulfilled", value = data}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                rejections[#rejections + 1] = item.rejectionReason
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    if #pending == 0 then
        return __TS__Promise.reject("No promises to resolve with .any()")
    end
    local numResolved = 0
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, data)
                        resolve(nil, data)
                    end,
                    function(____, reason)
                        rejections[#rejections + 1] = reason
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(nil, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, value) return resolve(nil, value) end,
                    function(____, reason) return reject(nil, reason) end
                )
            end
        end
    )
end

local Set
do
    Set = __TS__Class()
    Set.name = "Set"
    function Set.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "Set"
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local array = values
            for ____, value in ipairs(array) do
                self:add(value)
            end
        end
    end
    function Set.prototype.add(self, value)
        local isNewValue = not self:has(value)
        if isNewValue then
            self.size = self.size + 1
        end
        if self.firstKey == nil then
            self.firstKey = value
            self.lastKey = value
        elseif isNewValue then
            self.nextKey[self.lastKey] = value
            self.previousKey[value] = self.lastKey
            self.lastKey = value
        end
        return self
    end
    function Set.prototype.clear(self)
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Set.prototype.delete(self, value)
        local contains = self:has(value)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[value]
            local previous = self.previousKey[value]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[value] = nil
            self.previousKey[value] = nil
        end
        return contains
    end
    function Set.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return self.nextKey[value] ~= nil or self.lastKey == value
    end
    Set.prototype[Symbol.iterator] = function(self)
        return self:values()
    end
    function Set.prototype.entries(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, key}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.values(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    Set[Symbol.species] = Set
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local ____unpack_0 = unpack
    if ____unpack_0 == nil then
        ____unpack_0 = table.unpack
    end
    local _unpack = ____unpack_0
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

local WeakMap
do
    WeakMap = __TS__Class()
    WeakMap.name = "WeakMap"
    function WeakMap.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "WeakMap"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self.items[value[1]] = value[2]
            end
        else
            for ____, kvp in ipairs(entries) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function WeakMap.prototype.delete(self, key)
        local contains = self:has(key)
        self.items[key] = nil
        return contains
    end
    function WeakMap.prototype.get(self, key)
        return self.items[key]
    end
    function WeakMap.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function WeakMap.prototype.set(self, key, value)
        self.items[key] = value
        return self
    end
    WeakMap[Symbol.species] = WeakMap
end

local WeakSet
do
    WeakSet = __TS__Class()
    WeakSet.name = "WeakSet"
    function WeakSet.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "WeakSet"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self.items[result.value] = true
            end
        else
            for ____, value in ipairs(values) do
                self.items[value] = true
            end
        end
    end
    function WeakSet.prototype.add(self, value)
        self.items[value] = true
        return self
    end
    function WeakSet.prototype.delete(self, value)
        local contains = self:has(value)
        self.items[value] = nil
        return contains
    end
    function WeakSet.prototype.has(self, value)
        return self.items[value] == true
    end
    WeakSet[Symbol.species] = WeakSet
end

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            elseif __TS__StringIncludes(_VERSION, "Lua 5.0") then
                trace = originalTraceback((("[Level " .. tostring(level)) .. "] ") .. message)
            else
                trace = originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            local function stringReplacer(____, file, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local chunkName = __TS__Match(file, "%[string \"([^\"]+)\"%]")
                    local sourceName = string.gsub(chunkName, ".lua$", ".ts")
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (sourceName .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return stringReplacer(nil, file, line) end
            )
            return result
        end
    end
end

local function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        for i = 0, #iterable - 1 do
            arr[i + 1] = __TS__StringAccess(iterable, i)
        end
    else
        local len = 0
        for ____, item in __TS__Iterator(iterable) do
            len = len + 1
            arr[len] = item
        end
    end
    return __TS__Unpack(arr)
end

local function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

local function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    local ____string_byte_result_0 = string.byte(self, index + 1)
    if ____string_byte_result_0 == nil then
        ____string_byte_result_0 = 0 / 0
    end
    return ____string_byte_result_0
end

local function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

local function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return self .. string.sub(
        fillString,
        1,
        math.floor(maxLength)
    )
end

local function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return string.sub(
        fillString,
        1,
        math.floor(maxLength)
    ) .. self
end

local __TS__StringReplace
do
    local sub = string.sub
    function __TS__StringReplace(source, searchValue, replaceValue)
        local startPos, endPos = string.find(source, searchValue, nil, true)
        if not startPos then
            return source
        end
        local before = sub(source, 1, startPos - 1)
        local ____temp_0
        if type(replaceValue) == "string" then
            ____temp_0 = replaceValue
        else
            ____temp_0 = replaceValue(nil, searchValue, startPos - 1, source)
        end
        local replacement = ____temp_0
        local after = sub(source, endPos + 1)
        return (before .. replacement) .. after
    end
end

local __TS__StringSplit
do
    local sub = string.sub
    local find = string.find
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local result = {}
        local resultIndex = 1
        if separator == nil or separator == "" then
            for i = 1, #source do
                result[resultIndex] = sub(source, i, i)
                resultIndex = resultIndex + 1
            end
        else
            local currentPos = 1
            while resultIndex <= limit do
                local startPos, endPos = find(source, separator, currentPos, true)
                if not startPos then
                    break
                end
                result[resultIndex] = sub(source, currentPos, startPos - 1)
                resultIndex = resultIndex + 1
                currentPos = endPos + 1
            end
            if resultIndex <= limit then
                result[resultIndex] = sub(source, currentPos)
            end
        end
        return result
    end
end

local __TS__StringReplaceAll
do
    local sub = string.sub
    local find = string.find
    function __TS__StringReplaceAll(source, searchValue, replaceValue)
        if type(replaceValue) == "string" then
            local concat = table.concat(
                __TS__StringSplit(source, searchValue),
                replaceValue
            )
            if #searchValue == 0 then
                return (replaceValue .. concat) .. replaceValue
            end
            return concat
        end
        local parts = {}
        local partsIndex = 1
        if #searchValue == 0 then
            parts[1] = replaceValue(nil, "", 0, source)
            partsIndex = 2
            for i = 1, #source do
                parts[partsIndex] = sub(source, i, i)
                parts[partsIndex + 1] = replaceValue(nil, "", i, source)
                partsIndex = partsIndex + 2
            end
        else
            local currentPos = 1
            while true do
                local startPos, endPos = find(source, searchValue, currentPos, true)
                if not startPos then
                    break
                end
                parts[partsIndex] = sub(source, currentPos, startPos - 1)
                parts[partsIndex + 1] = replaceValue(nil, searchValue, startPos - 1, source)
                partsIndex = partsIndex + 2
                currentPos = endPos + 1
            end
            parts[partsIndex] = sub(source, currentPos)
        end
        return table.concat(parts)
    end
end

local function __TS__StringSlice(self, start, ____end)
    if start == nil or start ~= start then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

local function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

local __TS__SymbolRegistryFor, __TS__SymbolRegistryKeyFor
do
    local symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not symbolRegistry[key] then
            symbolRegistry[key] = __TS__Symbol(key)
        end
        return symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(symbolRegistry) do
            if symbolRegistry[key] == sym then
                return key
            end
        end
    end
end

local function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

return {
  __TS__ArrayConcat = __TS__ArrayConcat,
  __TS__ArrayEntries = __TS__ArrayEntries,
  __TS__ArrayEvery = __TS__ArrayEvery,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__ArrayFindIndex = __TS__ArrayFindIndex,
  __TS__ArrayFrom = __TS__ArrayFrom,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayIndexOf = __TS__ArrayIndexOf,
  __TS__ArrayIsArray = __TS__ArrayIsArray,
  __TS__ArrayJoin = __TS__ArrayJoin,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayPush = __TS__ArrayPush,
  __TS__ArrayPushArray = __TS__ArrayPushArray,
  __TS__ArrayReduce = __TS__ArrayReduce,
  __TS__ArrayReduceRight = __TS__ArrayReduceRight,
  __TS__ArrayReverse = __TS__ArrayReverse,
  __TS__ArrayUnshift = __TS__ArrayUnshift,
  __TS__ArraySort = __TS__ArraySort,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__ArraySome = __TS__ArraySome,
  __TS__ArraySplice = __TS__ArraySplice,
  __TS__ArrayToObject = __TS__ArrayToObject,
  __TS__ArrayFlat = __TS__ArrayFlat,
  __TS__ArrayFlatMap = __TS__ArrayFlatMap,
  __TS__ArraySetLength = __TS__ArraySetLength,
  __TS__AsyncAwaiter = __TS__AsyncAwaiter,
  __TS__Await = __TS__Await,
  __TS__Class = __TS__Class,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__CloneDescriptor = __TS__CloneDescriptor,
  __TS__CountVarargs = __TS__CountVarargs,
  __TS__Decorate = __TS__Decorate,
  __TS__DecorateParam = __TS__DecorateParam,
  __TS__Delete = __TS__Delete,
  __TS__DelegatedYield = __TS__DelegatedYield,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__FunctionBind = __TS__FunctionBind,
  __TS__Generator = __TS__Generator,
  __TS__InstanceOf = __TS__InstanceOf,
  __TS__InstanceOfObject = __TS__InstanceOfObject,
  __TS__Iterator = __TS__Iterator,
  __TS__LuaIteratorSpread = __TS__LuaIteratorSpread,
  Map = Map,
  __TS__Match = __TS__Match,
  __TS__MathAtan2 = __TS__MathAtan2,
  __TS__MathModf = __TS__MathModf,
  __TS__MathSign = __TS__MathSign,
  __TS__Modulo50 = __TS__Modulo50,
  __TS__New = __TS__New,
  __TS__Number = __TS__Number,
  __TS__NumberIsFinite = __TS__NumberIsFinite,
  __TS__NumberIsNaN = __TS__NumberIsNaN,
  __TS__NumberToString = __TS__NumberToString,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ObjectDefineProperty = __TS__ObjectDefineProperty,
  __TS__ObjectEntries = __TS__ObjectEntries,
  __TS__ObjectFromEntries = __TS__ObjectFromEntries,
  __TS__ObjectGetOwnPropertyDescriptor = __TS__ObjectGetOwnPropertyDescriptor,
  __TS__ObjectGetOwnPropertyDescriptors = __TS__ObjectGetOwnPropertyDescriptors,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ObjectRest = __TS__ObjectRest,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Promise = __TS__Promise,
  __TS__PromiseAll = __TS__PromiseAll,
  __TS__PromiseAllSettled = __TS__PromiseAllSettled,
  __TS__PromiseAny = __TS__PromiseAny,
  __TS__PromiseRace = __TS__PromiseRace,
  Set = Set,
  __TS__SetDescriptor = __TS__SetDescriptor,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread,
  WeakMap = WeakMap,
  WeakSet = WeakSet,
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Spread = __TS__Spread,
  __TS__StringAccess = __TS__StringAccess,
  __TS__StringCharAt = __TS__StringCharAt,
  __TS__StringCharCodeAt = __TS__StringCharCodeAt,
  __TS__StringEndsWith = __TS__StringEndsWith,
  __TS__StringIncludes = __TS__StringIncludes,
  __TS__StringPadEnd = __TS__StringPadEnd,
  __TS__StringPadStart = __TS__StringPadStart,
  __TS__StringReplace = __TS__StringReplace,
  __TS__StringReplaceAll = __TS__StringReplaceAll,
  __TS__StringSlice = __TS__StringSlice,
  __TS__StringSplit = __TS__StringSplit,
  __TS__StringStartsWith = __TS__StringStartsWith,
  __TS__StringSubstr = __TS__StringSubstr,
  __TS__StringSubstring = __TS__StringSubstring,
  __TS__StringTrim = __TS__StringTrim,
  __TS__StringTrimEnd = __TS__StringTrimEnd,
  __TS__StringTrimStart = __TS__StringTrimStart,
  __TS__Symbol = __TS__Symbol,
  Symbol = Symbol,
  __TS__SymbolRegistryFor = __TS__SymbolRegistryFor,
  __TS__SymbolRegistryKeyFor = __TS__SymbolRegistryKeyFor,
  __TS__TypeOf = __TS__TypeOf,
  __TS__Unpack = __TS__Unpack
}
 end,
["lib.CommandUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.cmdWithAssert(command, undo)
    assert(command, "command may not be empty")
    local result = Cmd(command, undo)
    assert(result == "OK", (("command faild: " .. command) .. ". error: ") .. result)
end
---
-- @return undefined if command succeeded. otherwise an error string.
function ____exports.cmdFailable(command, undo)
    assert(command, "command may not be empty")
    local res = Cmd(command, undo)
    local ____temp_0
    if res == "OK" then
        ____temp_0 = nil
    else
        ____temp_0 = res
    end
    return ____temp_0
end
function ____exports.UndoBlock(self, name, enabled)
    if enabled == nil then
        enabled = true
    end
    local ____enabled_1
    if enabled then
        ____enabled_1 = CreateUndo(name)
    else
        ____enabled_1 = nil
    end
    local undo = ____enabled_1
    local function close(self)
        if enabled == true then
            CloseUndo(undo)
        end
    end
    local function _cmd(command)
        if enabled == true then
            ____exports.cmdWithAssert(command, undo)
        else
            ____exports.cmdWithAssert(command)
        end
    end
    local function _cmdIndirect(command)
        assert(command, "command may not be empty")
        if enabled == true then
            CmdIndirect(command, undo)
        else
            CmdIndirect(command)
        end
    end
    local function _cmdFailable(command)
        if enabled == true then
            return ____exports.cmdFailable(command, undo)
        else
            return ____exports.cmdFailable(command)
        end
    end
    return {cmd = _cmd, cmdIndirect = _cmdIndirect, cmdFailable = _cmdFailable, close = close}
end
return ____exports
 end,
["lib.ExternalCommandCodecV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__TypeOf = ____lualib.__TS__TypeOf
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
--- Encoded a parmaters object, to a comma delimited string.
-- This string can beis used in a Macro that calls a Plugin.
-- 
-- Each property of the object is encoded into 3 strings:
-- [propName],[type],[value]
-- 
-- We use this simple codec and not JSON codec, since we are limited in what we can use in a Macro command.
local SEPERATOR = ","
local function encodeParamValue(self, value)
    if type(value) == "number" then
        return "number," .. tostring(value)
    elseif type(value) == "string" then
        return "string," .. value
    elseif type(value) == "boolean" then
        return "boolean," .. (value and "__true" or "__false")
    else
        error("PluginUtils:encodeParam() Unsupported type " .. __TS__TypeOf(value))
    end
end
local function encodeAction(self, action)
    local s = action.type
    if action.params ~= nil then
        for ____, ____value in ipairs(__TS__ObjectEntries(action.params)) do
            local k = ____value[1]
            local v = ____value[2]
            s = s .. (("," .. k) .. ",") .. encodeParamValue(nil, v)
        end
    end
    return s
end
local function decodeParam(self, typeAndValue)
    local ____type, value = table.unpack(typeAndValue)
    repeat
        local ____switch12 = ____type
        local ____cond12 = ____switch12 == "number"
        if ____cond12 then
            do
                return __TS__ParseInt(value)
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "boolean"
        if ____cond12 then
            do
                if value == "__true" then
                    return true
                elseif value == "__false" then
                    return false
                end
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "string"
        if ____cond12 then
            do
                return value
            end
        end
        do
            do
                error("ExternalCommandCodec: Unsupported type " .. ____type)
            end
        end
    until true
end
--- Decode string params into an object
-- 
-- @param encodedParams string comma separated params
-- @return table array of decoded params. decodes numbers.
local function decodeAction(self, encodedParams)
    local parts = __TS__StringSplit(encodedParams, SEPERATOR)
    local params = {}
    local index = 1
    while index < #parts do
        local propName = parts[index + 1]
        params[propName] = decodeParam(nil, {parts[index + 1 + 1], parts[index + 2 + 1]})
        index = index + 3
    end
    return {type = parts[1], params = params}
end
____exports.ActionCodec = {encodeAction = encodeAction, decodeAction = decodeAction}
return ____exports
 end,
["lib.TimeUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____socket = require("socket")
local gettime = ____socket.gettime
function ____exports.getTimeMillis(self)
    return gettime() * 1000
end
return ____exports
 end,
["lib.Logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____TimeUtils = require("lib.TimeUtils")
local getTimeMillis = ____TimeUtils.getTimeMillis
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.TRACE = 1
____exports.LogLevel[____exports.LogLevel.TRACE] = "TRACE"
____exports.LogLevel.DEBUG = 2
____exports.LogLevel[____exports.LogLevel.DEBUG] = "DEBUG"
____exports.LogLevel.INFO = 3
____exports.LogLevel[____exports.LogLevel.INFO] = "INFO"
____exports.LogLevel.WARN = 4
____exports.LogLevel[____exports.LogLevel.WARN] = "WARN"
____exports.LogLevel.ERROR = 5
____exports.LogLevel[____exports.LogLevel.ERROR] = "ERROR"
local logLevelString = {
    "TRACE",
    "DEBUG",
    "INFO",
    "WARN",
    "ERROR"
}
function ____exports.toLogLevelString(self, logLevel)
    return logLevelString[logLevel]
end
local DEFAULT_LOG_LEVEL = ____exports.LogLevel.ERROR
---
-- @param configs a config heirarchy (anscestors) of this logger
function ____exports.Logger(self, params)
    local ____temp_0 = params == nil and ({}) or params
    local prefix = ____temp_0.prefix
    local logLevel = ____temp_0.logLevel
    local withElappsedTimePrefixd = ____temp_0.withElappsedTimePrefixd
    local _prefix = table.concat(
        __TS__ArrayMap(
            prefix or ({}),
            function(____, p) return ("[" .. p) .. "]" end
        ),
        ""
    )
    local childLoggers = {}
    local _logLevel = logLevel or DEFAULT_LOG_LEVEL
    local lastTimestamp
    local function makeTimeStamp(self)
        local curTime = getTimeMillis(nil)
        local ____temp_1
        if lastTimestamp == nil then
            ____temp_1 = nil
        else
            ____temp_1 = math.floor(curTime - lastTimestamp + 0.5)
        end
        local elapsed = ____temp_1
        lastTimestamp = curTime
        return elapsed
    end
    local function _prefixMsg(self, msg)
        local elapsed
        if withElappsedTimePrefixd then
            elapsed = makeTimeStamp(nil)
        end
        local elapsedPart = withElappsedTimePrefixd and ("[" .. tostring(elapsed == nil and "?" or elapsed)) .. "ms]" or ""
        return (((_prefix .. ":") .. elapsedPart) .. " ") .. msg
    end
    local function _prefixMsgWithLevel(self, msg, logLevel)
        local elapsed
        if withElappsedTimePrefixd then
            elapsed = makeTimeStamp(nil)
        end
        local elapsedPart = withElappsedTimePrefixd and ("[" .. tostring(elapsed == nil and "?" or elapsed)) .. "ms]" or ""
        return (((((_prefix .. ":") .. elapsedPart) .. " ") .. logLevelString[logLevel]) .. " ") .. msg
    end
    local function _printf(self, msg)
        Printf(_prefixMsg(nil, msg))
    end
    local function _echo(self, msg)
        Echo(_prefixMsg(nil, msg))
    end
    local function _trace(self, msg)
        if _logLevel <= ____exports.LogLevel.TRACE then
            Echo(_prefixMsgWithLevel(nil, msg, ____exports.LogLevel.TRACE))
        end
    end
    local function _debug(self, msg)
        if _logLevel <= ____exports.LogLevel.DEBUG then
            Echo(_prefixMsgWithLevel(nil, msg, ____exports.LogLevel.DEBUG))
        end
    end
    local function _info(self, msg)
        if _logLevel <= ____exports.LogLevel.INFO then
            Echo(_prefixMsgWithLevel(nil, msg, ____exports.LogLevel.INFO))
        end
    end
    local function _warn(self, msg)
        if _logLevel <= ____exports.LogLevel.WARN then
            Echo(_prefixMsgWithLevel(nil, msg, ____exports.LogLevel.WARN))
        end
    end
    local function _error(self, msg)
        Echo(_prefixMsgWithLevel(nil, msg, ____exports.LogLevel.ERROR))
    end
    local function subLogger(self, subPrefix)
        local ____exports_Logger_3 = ____exports.Logger
        local ____array_2 = __TS__SparseArrayNew(table.unpack(prefix or ({})))
        __TS__SparseArrayPush(____array_2, subPrefix)
        local newLogger = ____exports_Logger_3(
            nil,
            {
                prefix = {__TS__SparseArraySpread(____array_2)},
                logLevel = _logLevel
            }
        )
        childLoggers[#childLoggers + 1] = newLogger
        return newLogger
    end
    local function setLogLevel(self, logLevel)
        _logLevel = logLevel
        for ____, logger in ipairs(childLoggers) do
            logger:setLogLevel(logLevel)
        end
    end
    return {
        msg = _prefixMsg,
        printf = _printf,
        echo = _echo,
        trace = _trace,
        debug = _debug,
        info = _info,
        warn = _warn,
        error = _error,
        subLogger = subLogger,
        getLogLevel = function() return _logLevel end,
        setLogLevel = setLogLevel
    }
end
return ____exports
 end,
["lib.StringUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local function nTimes(self, n, fn)
    assert(n >= 1)
    do
        local i = 1
        while i <= n do
            fn(nil, i)
            i = i + 1
        end
    end
end
---
-- @param str Removes spaces from beggining and end of string
-- @returns
function ____exports.trimSpaces(self, str)
    local start = 0
    local ____end = #str
    do
        local i = 0
        while i < #str do
            if __TS__StringAccess(str, i) ~= " " then
                start = i
                break
            end
            i = i + 1
        end
    end
    do
        local i = #str - 1
        while i >= 0 do
            if __TS__StringAccess(str, i) ~= " " then
                ____end = i + 1
                break
            end
            i = i - 1
        end
    end
    return __TS__StringSubstring(str, start, ____end)
end
--- Last index of
-- 
-- @param str a string to search in
-- @param search a single character
-- @returns 0-based index of the seach character
function ____exports.lastIndexOf(self, str, search)
    assert(#search == 1, "lastIndexOf: search term must be a single character")
    do
        local i = #str - 1
        while i >= 0 do
            if __TS__StringAccess(str, i) == search then
                return i
            end
            i = i - 1
        end
    end
    return -1
end
local function ____repeat(self, str, times)
    local result = ""
    nTimes(
        nil,
        times,
        function()
            result = result .. str
        end
    )
    return result
end
____exports.StringUtils = {["repeat"] = ____repeat}
return ____exports
 end,
["lib.Utils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local __TS__ArrayFrom = ____lualib.__TS__ArrayFrom
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.objectKeys(self, t)
    local keys = {}
    for k, _v in pairs(t) do
        keys[#keys + 1] = k
    end
    return keys
end
--- And identity function to do type checking on object literals.
function ____exports.typed(self, x)
    return x
end
function ____exports.isInteger(self, s)
    return tonumber(s) ~= nil
end
function ____exports.withDefault(self, value, defaultValue)
    local ____temp_0
    if value == nil then
        ____temp_0 = defaultValue
    else
        ____temp_0 = value
    end
    return ____temp_0
end
function ____exports.ifDef(self, x, fn)
    local ____temp_1
    if x == nil then
        ____temp_1 = nil
    else
        ____temp_1 = fn(nil, x)
    end
    return ____temp_1
end
function ____exports.applyObjProps(self, obj, props)
    for ____, key in ipairs(____exports.objectKeys(nil, props)) do
        obj[key] = props[key]
    end
    return obj
end
function ____exports.applyObjPropsWithDefaults(self, obj, defaults, props)
    ____exports.applyObjProps(nil, obj, defaults)
    ____exports.applyObjProps(nil, obj, props)
    return obj
end
function ____exports.objectValues(self, t)
    local values = {}
    for _k, v in pairs(t) do
        values[#values + 1] = v
    end
    return values
end
____exports.objectEntries = pairs
function ____exports.isEmptyObject(self, obj)
    return #____exports.objectKeys(nil, obj) == 0
end
function ____exports.objectNumOfItems(self, t)
    return #____exports.objectKeys(nil, t)
end
function ____exports.toString(self, arr)
    return ("[" .. __TS__ArrayJoin(arr, ",")) .. "]"
end
function ____exports.isUndefined(self, x)
    return x == nil
end
function ____exports.isDefined(self, x)
    return x ~= nil
end
--- Creates an array with ascending integer numbers (interval 1)
-- 
-- @param start start number (including)
-- @param end end number (including)
-- @returns
function ____exports.series(self, start, ____end)
    return __TS__ArrayFrom(
        {length = ____end - start + 1},
        function(____, _, i) return i + start end
    )
end
--- Run given function n times
-- 
-- @param fn function receives 1-based index
function ____exports.nTimes(self, n, fn)
    assert(n >= 1)
    do
        local i = 1
        while i <= n do
            fn(nil, i)
            i = i + 1
        end
    end
end
--- Find the first (lowest) integer number,starting from 1, that is not in the given array.
function ____exports.findFirstAvailableNumber(self, sortedNumbers)
    if #sortedNumbers == 0 then
        return 1
    end
    local lastNumber = sortedNumbers[1]
    for ____, n in ipairs(sortedNumbers) do
        if lastNumber ~= nil and n > lastNumber + 1 then
            return lastNumber + 1
        end
        lastNumber = n
    end
    return lastNumber + 1
end
function ____exports.arrayMove(self, arr, oldIndex, newIndex, count)
    if count == nil then
        count = 1
    end
    if newIndex + count >= #arr then
        local k = newIndex + count - #arr + 1
        while true do
            local ____k_2 = k
            k = ____k_2 - 1
            if not (____k_2 > 0) then
                break
            end
            arr[#arr + 1] = nil
        end
    end
    __TS__ArraySplice(
        arr,
        newIndex,
        0,
        table.unpack(__TS__ArraySplice(arr, oldIndex, count))
    )
end
function ____exports.compareWithUndefined(self, a, b, getCondition)
    local aValue = getCondition(nil, a)
    local bValue = getCondition(nil, b)
    if aValue == nil and bValue == nil then
        return 0
    end
    if aValue == nil then
        return -1
    end
    if bValue == nil then
        return 1
    end
    return aValue - bValue
end
function ____exports.getErrorMessage(self, err)
    return type(err) == "string" and err or (type(err) == "table" and (err.message or "No Error Message") or "Unknown")
end
--- This replaces TSTL's try/catch (which uses pcall)
-- since it uses xpcall, that captures the FULL traceback.
function ____exports.protectedCall(self, params)
    local ____params_3 = params
    local fn = ____params_3.fn
    local onError = ____params_3.onError
    local errorPrefix = ____params_3.errorPrefix
    local proError = {type = "ProError", message = "", tracebackPrinted = false}
    local function errorMsgHandler(err)
        if type(err) == "table" and err.type == "ProError" and err.tracebackPrinted then
            return
        end
        proError.message = ____exports.getErrorMessage(nil, err)
        Echo(((errorPrefix or "") .. " ERROR : ") .. proError.message)
        Echo(debug.traceback())
        proError.tracebackPrinted = true
    end
    local status, retVal = xpcall(
        function() return fn(nil) end,
        function(err) return errorMsgHandler(err) end
    )
    if not status then
        onError(nil, proError)
        return {success = false, returnValue = nil}
    else
        return {success = true, returnValue = retVal}
    end
end
return ____exports
 end,
["lib.MAUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAPoolsInfo = require("lib.MAPoolsInfo")
local MAPoolsInfo = ____MAPoolsInfo.MAPoolsInfo
local ____StringUtils = require("lib.StringUtils")
local lastIndexOf = ____StringUtils.lastIndexOf
local ____Utils = require("lib.Utils")
local isInteger = ____Utils.isInteger
function ____exports.getChildByIndex(self, parent, index)
    for ____, obj in ipairs(parent:Children()) do
        if obj.index == index then
            return obj
        end
    end
end
function ____exports.buildAddress(self, keyword, idOrName, childIdOrName)
    local idPart = type(idOrName) == "string" and ("\"" .. idOrName) .. "\"" or idOrName
    local childIdPart = childIdOrName == nil and "" or "." .. tostring(type(childIdOrName) == "string" and ("\"" .. childIdOrName) .. "\"" or childIdOrName)
    return ((keyword .. " ") .. tostring(idPart)) .. childIdPart
end
function ____exports.buildMultiKeywordAddress(self, keyword1, idOrName1, keyword2, idOrName2)
    local idPart1 = type(idOrName1) == "string" and ("\"" .. idOrName1) .. "\"" or idOrName1
    local idPart2 = type(idOrName2) == "string" and ("\"" .. idOrName2) .. "\"" or idOrName2
    return (((((keyword1 .. " ") .. tostring(idPart1)) .. " ") .. keyword2) .. " ") .. tostring(idPart2)
end
function ____exports.childExists(self, parent, index)
    return ____exports.getChildByIndex(nil, parent, index) ~= nil
end
function ____exports.getChildByNameOrIndex(self, parent, nameOrIndex)
    if type(nameOrIndex) == "string" then
        return parent[nameOrIndex]
    end
    if type(nameOrIndex) == "number" then
        for ____, obj in ipairs(parent:Children()) do
            if obj.index == nameOrIndex then
                return obj
            end
        end
    end
end
--- Get the child's index (in the parents children array) by the object id ("INDEX" property)
-- 
-- @returns an "absolute" index to be used in MA Object-API functions (not with TypeScript arrays)
function ____exports.getChildIndexById(self, parent, indexOrName)
    local children = parent:Children()
    if type(indexOrName) == "string" then
        do
            local i = -1
            while i < #children do
                local obj = children[i + 1]
                if obj ~= nil and obj.name == indexOrName then
                    return i + 1
                end
                i = i + 1
            end
        end
    else
        do
            local i = -1
            while i < #children do
                local obj = children[i + 1]
                if obj ~= nil and obj.index == indexOrName then
                    return i + 1
                end
                i = i + 1
            end
        end
    end
    return nil
end
local log = Printf
function ____exports.fromAddr(self, addr)
    local pc = MAPoolsInfo(nil)
    local parts = __TS__StringSplit(addr, " ")
    local partIndex = 0
    local curObj
    local curPoolConfig
    while partIndex < #parts do
        if partIndex > 0 and curObj == nil then
            error(
                __TS__New(Error, "Invalid address " .. addr),
                0
            )
        end
        local keyword = parts[partIndex + 1]
        if curPoolConfig == nil then
            local pools = pc:byKeyword(keyword)
            if #pools == 0 then
                log(((("fromAddr(" .. addr) .. "): partIndex = ") .. tostring(partIndex)) .. " : UNDEF : ERROR")
                error(
                    __TS__New(Error, (("Invalid address " .. addr) .. ". Unsupported keyword: ") .. keyword),
                    0
                )
            end
            local hadSubPool = #pools > 1 or pools[1].subPoolIndex ~= nil
            if hadSubPool then
                local addrSuffixParts = __TS__StringSplit(parts[partIndex + 1 + 1], ".")
                if #addrSuffixParts == 2 then
                    local subPoolIdString, objectIdString = table.unpack(addrSuffixParts)
                    if not isInteger(nil, subPoolIdString) then
                        error(
                            __TS__New(Error, (("Invalid address " .. addr) .. ". subPoolId is not a number. subPoolId=") .. subPoolIdString),
                            0
                        )
                    end
                    local subPoolIndexNumber = __TS__ParseInt(subPoolIdString)
                    curPoolConfig = __TS__ArrayFind(
                        pools,
                        function(____, p) return p.subPoolIndex == subPoolIndexNumber end
                    )
                    if curPoolConfig == nil then
                        error(
                            __TS__New(Error, (("Invalid address " .. addr) .. ". Invalid subPoolindex ") .. subPoolIdString),
                            0
                        )
                    end
                    if not isInteger(nil, objectIdString) then
                        error(
                            __TS__New(Error, (("Invalid address " .. addr) .. ". objectId is not a number. objectId=") .. objectIdString),
                            0
                        )
                    end
                    local parent = curPoolConfig:getPoolObject(curPoolConfig:getDefaultParent())
                    local id = __TS__ParseInt(objectIdString)
                    curObj = ____exports.getChildByIndex(
                        nil,
                        curPoolConfig:getPoolObject(curPoolConfig:getDefaultParent()),
                        __TS__ParseInt(objectIdString)
                    )
                else
                    error(
                        __TS__New(Error, ("Invalid address " .. addr) .. ". must have a sub index"),
                        0
                    )
                end
            else
                curPoolConfig = pools[1]
                local objectIdString = parts[2]
                if not isInteger(nil, objectIdString) then
                    error(
                        __TS__New(Error, (("Invalid address " .. addr) .. ". objectId is not a number. objectId=") .. objectIdString),
                        0
                    )
                end
                curObj = ____exports.getChildByIndex(
                    nil,
                    curPoolConfig:getPoolObject(curPoolConfig:getDefaultParent()),
                    __TS__ParseInt(objectIdString)
                )
            end
        else
            if curPoolConfig.childKeyword ~= nil and curPoolConfig.childKeyword == keyword then
                local objIdString = parts[partIndex + 1 + 1]
                if not isInteger(nil, objIdString) then
                    error(
                        __TS__New(Error, (("Invalid address " .. addr) .. ". objectId is not a number. objectId=") .. objIdString),
                        0
                    )
                end
                curObj = ____exports.getChildByIndex(
                    nil,
                    curObj,
                    __TS__ParseInt(objIdString)
                )
            end
        end
        partIndex = partIndex + 2
    end
    return curObj
end
---
-- @param name Strip the auto-added suffix (#2, #3,...), which MA adds when multiple pool items have the same name
-- @returns
function ____exports.stripSuffix(self, name)
    local lastHashIndex = lastIndexOf(nil, name, "#")
    return lastHashIndex == -1 and name or __TS__StringSlice(
        name,
        0,
        lastIndexOf(nil, name, "#")
    )
end
return ____exports
 end,
["lib.MutexFactory.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.HookManager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
____exports.HookChangeType = HookChangeType or ({})
____exports.HookChangeType.DELETE = 5
____exports.HookChangeType[____exports.HookChangeType.DELETE] = "DELETE"
--- Minimum interval between 2 hook callback of the same hookId.
-- This is a workaround for unexplained duplicate callback calls.
-- Happends in MA3 version 1.8.1
local MIN_INTERVAL_SEC = 0.1
--- Hook manager allows registering hook callbacks by hookId.
-- If a new callback is registered with the same hookId, it will replace the existing one.
-- 
-- It also take care of multi-thread issues, and assets that hook callbacks are no invoked in parallel.
-- 
-- @param id string - used to distinguish Hook Managers
function ____exports.HookManager(self, params)
    local unHook, _unHook, log, directory
    function unHook(self, params)
        _unHook(
            nil,
            {
                hookId = params.hookId,
                objHandleInt = HandleToInt(params.obj)
            }
        )
    end
    function _unHook(self, params)
        local ____params_2 = params
        local hookId = ____params_2.hookId
        local objHandleInt = ____params_2.objHandleInt
        if directory[objHandleInt] == nil then
            log:trace(("Unhook: hookId=" .. hookId) .. ": object has no hooks at all")
            return
        end
        if directory[objHandleInt][hookId] == nil then
            log:trace(("Unhook: hookId=" .. hookId) .. ": no hookId found")
            return
        end
        local ____directory_objHandleInt_hookId_3 = directory[objHandleInt][hookId]
        local hookIndex = ____directory_objHandleInt_hookId_3.hookIndex
        log:trace("Unhook: hookId=" .. hookId)
        Unhook(hookIndex)
        local objectHooks = directory[objHandleInt]
        __TS__Delete(objectHooks, hookId)
        if #__TS__ObjectKeys(objectHooks) == 0 then
            __TS__Delete(directory, objHandleInt)
        end
    end
    local ____params_0 = params
    local id = ____params_0.id
    local pluginHandle = ____params_0.pluginHandle
    local parentLog = ____params_0.parentLog
    local mutexFactory = ____params_0.mutexFactory
    log = parentLog:subLogger("HookManager")
    directory = {}
    local mutex = mutexFactory:create(log)
    local function hook(self, params)
        local ____params_1 = params
        local hookId = ____params_1.hookId
        local obj = ____params_1.obj
        local onChange = ____params_1.onChange
        local objHandleInt = HandleToInt(obj)
        local isHooked = directory[objHandleInt] ~= nil and directory[objHandleInt][hookId] ~= nil
        if isHooked then
            log:trace(("hook() hookId=" .. hookId) .. " is already hooked. Un-hooking")
            unHook(nil, {hookId = hookId, obj = obj})
        end
        local objHooks = directory[objHandleInt]
        if objHooks == nil then
            objHooks = {}
            directory[objHandleInt] = objHooks
        end
        log:trace("hook() hooking hookId=" .. hookId)
        local function callbackWrapper(obj, changeType)
            log:trace((((("callbackWrapper[hookId=" .. hookId) .. "]: START changeType=") .. tostring(changeType)) .. ", obj.name=") .. (changeType == Enums.ChangeLevel.Delete and "" or obj.name))
            local curTime = Time()
            mutex:lock()
            do
                pcall(function()
                    log:trace(("callbackWrapper[hookId=" .. hookId) .. "]: GOT LOCK")
                    if directory[objHandleInt] ~= nil then
                        local hookEntry = directory[objHandleInt][hookId]
                        if hookEntry ~= nil then
                            local function callHook(self)
                                if changeType == Enums.ChangeLevel.Delete then
                                    unHook(nil, {hookId = hookId, obj = obj})
                                else
                                    hookEntry.lastCallbackTimestamp = curTime
                                end
                                hookEntry.callback(obj, changeType)
                            end
                            local lastCallbackTimestamp = hookEntry.lastCallbackTimestamp
                            if lastCallbackTimestamp == nil then
                                log:trace(("callbackWrapper[hookId=" .. hookId) .. "]: Calling user listener - interval=[Un-initialized]")
                                callHook(nil)
                            else
                                local interval = curTime - (lastCallbackTimestamp == nil and 0 or lastCallbackTimestamp)
                                if interval > MIN_INTERVAL_SEC then
                                    log:trace((((("callbackWrapper[hookId=" .. hookId) .. "]: Calling user listener - interval=") .. tostring(interval)) .. " > ") .. tostring(MIN_INTERVAL_SEC))
                                    callHook(nil)
                                else
                                    log:trace((((("callbackWrapper[hookId=" .. hookId) .. "]: Ignoring duplicate hook - interval=") .. tostring(interval)) .. " <= ") .. tostring(MIN_INTERVAL_SEC))
                                end
                            end
                        end
                    else
                    end
                end)
                do
                    log:trace(("callbackWrapper[hookId=" .. hookId) .. "]: RELEASING LOCK")
                    mutex:unlock()
                end
            end
            log:trace(("callbackWrapper[hookId=" .. hookId) .. "]: END")
        end
        local hookIndex = HookObjectChange(callbackWrapper, obj, pluginHandle)
        directory[objHandleInt][hookId] = {hookIndex = hookIndex, callback = onChange, callbackWrapper = callbackWrapper}
    end
    local function cleanup(self)
        for ____, objHandleInt in ipairs(objectKeys(nil, directory)) do
            local objectHooks = directory[objHandleInt]
            for ____, hookId in ipairs(objectKeys(nil, objectHooks)) do
                _unHook(nil, {hookId = hookId, objHandleInt = objHandleInt})
            end
        end
        mutex:destroy()
    end
    return {hook = hook, unHook = unHook, cleanup = cleanup}
end
return ____exports
 end,
["lib.ma_obj.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.MediaPool = MediaPool or ({})
____exports.MediaPool.Gobos = 1
____exports.MediaPool[____exports.MediaPool.Gobos] = "Gobos"
____exports.MediaPool.Symbols = 2
____exports.MediaPool[____exports.MediaPool.Symbols] = "Symbols"
____exports.MediaPool.Images = 3
____exports.MediaPool[____exports.MediaPool.Images] = "Images"
____exports.MediaPool.MeshImagePool = 4
____exports.MediaPool[____exports.MediaPool.MeshImagePool] = "MeshImagePool"
____exports.MediaPool.Videos = 5
____exports.MediaPool[____exports.MediaPool.Videos] = "Videos"
____exports.MediaPool.Sounds = 6
____exports.MediaPool[____exports.MediaPool.Sounds] = "Sounds"
____exports.MediaPoolNames = {
    [____exports.MediaPool.Gobos] = "Gobos",
    [____exports.MediaPool.Symbols] = "Symbols",
    [____exports.MediaPool.Images] = "Images",
    [____exports.MediaPool.MeshImagePool] = "MeshImagePool",
    [____exports.MediaPool.Videos] = "Videos",
    [____exports.MediaPool.Sounds] = "Sounds"
}
____exports.PresetPoolType = PresetPoolType or ({})
____exports.PresetPoolType.Dimmer = 1
____exports.PresetPoolType[____exports.PresetPoolType.Dimmer] = "Dimmer"
____exports.PresetPoolType.Position = 2
____exports.PresetPoolType[____exports.PresetPoolType.Position] = "Position"
____exports.PresetPoolType.Gobo = 3
____exports.PresetPoolType[____exports.PresetPoolType.Gobo] = "Gobo"
____exports.PresetPoolType.Color = 4
____exports.PresetPoolType[____exports.PresetPoolType.Color] = "Color"
____exports.PresetPoolType.Beam = 5
____exports.PresetPoolType[____exports.PresetPoolType.Beam] = "Beam"
____exports.PresetPoolType.Focus = 6
____exports.PresetPoolType[____exports.PresetPoolType.Focus] = "Focus"
____exports.PresetPoolType.Control = 7
____exports.PresetPoolType[____exports.PresetPoolType.Control] = "Control"
____exports.PresetPoolType.Chapers = 8
____exports.PresetPoolType[____exports.PresetPoolType.Chapers] = "Chapers"
____exports.PresetPoolType.Video = 9
____exports.PresetPoolType[____exports.PresetPoolType.Video] = "Video"
____exports.PresetPoolType.All_1 = 21
____exports.PresetPoolType[____exports.PresetPoolType.All_1] = "All_1"
____exports.PresetPoolType.All_2 = 22
____exports.PresetPoolType[____exports.PresetPoolType.All_2] = "All_2"
____exports.PresetPoolType.All_3 = 23
____exports.PresetPoolType[____exports.PresetPoolType.All_3] = "All_3"
____exports.PresetPoolType.All_4 = 24
____exports.PresetPoolType[____exports.PresetPoolType.All_4] = "All_4"
____exports.PresetPoolType.All_5 = 25
____exports.PresetPoolType[____exports.PresetPoolType.All_5] = "All_5"
do
    local ____HookManager = require("lib.HookManager")
    local HookChangeType = ____HookManager.HookChangeType
    ____exports.HookChangeType = HookChangeType
end
____exports.ExecMode = ExecMode or ({})
____exports.ExecMode.CmdLine = 0
____exports.ExecMode[____exports.ExecMode.CmdLine] = "CmdLine"
____exports.ExecMode.DirectLua = 1
____exports.ExecMode[____exports.ExecMode.DirectLua] = "DirectLua"
____exports.MAX_EXEC_NUMBER = 490
function ____exports.isValidExecNumber(self, execNumber)
    local modValue = execNumber % 100
    if execNumber > 300 then
        return execNumber <= ____exports.MAX_EXEC_NUMBER and modValue <= 90
    else
        return modValue <= 98
    end
end
return ____exports
 end,
["lib.ma_obj.HMedia"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local getChildByNameOrIndex = ____MAUtils.getChildByNameOrIndex
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local HMedia = __TS__Class()
HMedia.name = "HMedia"
__TS__ClassExtends(HMedia, HObject)
function HMedia.prototype.____constructor(self, mediaPool, id, context)
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "Image", mediaPool, id),
        id,
        {
            context = context,
            _getObj = function() return getChildByNameOrIndex(
                nil,
                Root().ShowData.MediaPools.Images,
                id
            ) end
        }
    )
    self.mediaPool = mediaPool
end
____exports.HMedia = HMedia
return ____exports
 end,
["lib.ma_obj.HAppearance"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local RGBAToProps
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____common = require("lib.ma_obj.common")
local ObjCache = ____common.ObjCache
local ____types = require("lib.ma_obj.types")
local MediaPool = ____types.MediaPool
local MediaPoolNames = ____types.MediaPoolNames
function RGBAToProps(self, color, p)
    local obj = {}
    obj[p .. "R"] = color.r
    obj[p .. "G"] = color.g
    obj[p .. "B"] = color.b
    obj[p .. "ALPHA"] = color.a
    return obj
end
____exports.HAppearance = __TS__Class()
local HAppearance = ____exports.HAppearance
HAppearance.name = "HAppearance"
__TS__ClassExtends(HAppearance, HObject)
function HAppearance.prototype.____constructor(self, id, context)
    local addr = buildAddress(nil, "Appearance", id)
    HObject.prototype.____constructor(
        self,
        addr,
        id,
        {
            context = context,
            _objCache = ObjCache(
                nil,
                ShowData().Appearances,
                id
            )
        }
    )
end
function HAppearance.prototype.delete(self)
    return HObject.prototype.delete(self)
end
function HAppearance.prototype.setColorProps(self, props)
    if props.backColor ~= nil then
        self:setProps(__TS__ObjectAssign(
            {},
            RGBAToProps(nil, props.backColor, "BACK")
        ))
    end
    if props.imageColor ~= nil then
        self:setProps(RGBAToProps(nil, props.imageColor, "IMAGE"))
    end
    return self
end
function HAppearance.prototype.setImage(self, media)
    assert(media.mediaPool == MediaPool.Gobos or media.mediaPool == MediaPool.Symbols or media.mediaPool == MediaPool.Images)
    self._cmd(((((("Set " .. self.addr) .. " image=\"showData.MediaPools.") .. MediaPoolNames[media.mediaPool]) .. ".") .. tostring(media.indexOrName)) .. "\"")
    return self
end
return ____exports
 end,
["lib.ma_obj.common"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local getChildByIndex = ____MAUtils.getChildByIndex
function ____exports.setAppearance(self, obj, appearance)
    if obj:getObj():Get("Appearance") ~= appearance:getObj() then
        if obj:isExecModeCmdLine() then
            appearance:assignTo(obj)
        else
            obj:setObjectProp("Appearance", appearance)
        end
    end
end
function ____exports.ObjCache(self, parent, id)
    local obj
    return {
        getObj = function(self)
            if obj == nil then
                if type(id) == "string" then
                    return parent[id]
                else
                    obj = getChildByIndex(nil, parent, id)
                end
                return obj
            else
                return obj
            end
        end,
        reset = function(self)
            obj = nil
        end
    }
end
return ____exports
 end,
["lib.ma_obj.HBasicObject"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____CommandUtils = require("lib.CommandUtils")
local cmdFailable = ____CommandUtils.cmdFailable
local ____Logger = require("lib.Logger")
local Logger = ____Logger.Logger
--- Helper for MA basic (built-in) object.
local HBasicObject = __TS__Class()
HBasicObject.name = "HBasicObject"
function HBasicObject.prototype.____constructor(self, options)
    local ____options_0 = options
    local context = ____options_0.context
    self.context = context
    self.log = context.log == nil and Logger(nil, {prefix = {"HBasicObject"}}) or context.log
    self.undoBlock = context.undoBlock
    self._getObj = options._getObj
    self._getParent = options._getParent
    self._cmd = self.undoBlock == nil and Cmd or self.undoBlock.cmd
    self._cmdIndirect = self.undoBlock == nil and CmdIndirect or self.undoBlock.cmdIndirect
    self._cmdFailable = self.undoBlock == nil and cmdFailable or self.undoBlock.cmdFailable
end
__TS__SetDescriptor(
    HBasicObject.prototype,
    "name",
    {get = function(self)
        return self:getObj().name
    end},
    true
)
__TS__SetDescriptor(
    HBasicObject.prototype,
    "index",
    {get = function(self)
        return self:getObj().index
    end},
    true
)
function HBasicObject.prototype.getParent(self)
    if self._getParent == nil then
        error("_this._getParent not defined")
    else
        return self:_getParent()
    end
end
function HBasicObject.prototype.getObj(self)
    local obj = self:_getObj()
    if obj == nil then
        error("HBasicObject.getObj(): Object not found")
    end
    return obj
end
function HBasicObject.prototype.exists(self)
    do
        local function ____catch()
            return true, false
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            self:getObj()
            return true, true
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch()
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function HBasicObject.prototype.hook(self, hookId, onChange)
    local context = self.context
    if context == nil or context.hookManager == nil then
        error("HBasicObject initialized without context, Can not use hooks")
    end
    context.hookManager:hook({
        hookId = hookId,
        obj = self:getObj(),
        onChange = onChange
    })
end
function HBasicObject.prototype.unHook(self, hookId)
    local context = self.context
    if context == nil or context.hookManager == nil then
        error("HBasicObject initialized without context, Can not use hooks")
    end
    if self:exists() then
        context.hookManager:unHook({
            hookId = hookId,
            obj = self:getObj()
        })
    else
        self.log:debug("unHook: object does not exist")
    end
    return self
end
____exports.HBasicObject = HBasicObject
return ____exports
 end,
["lib.ma_obj.HObject"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local propsToString, toLuaPropValue, toCmdPropValue
local ____MAUtils = require("lib.MAUtils")
local getChildIndexById = ____MAUtils.getChildIndexById
local ____Utils = require("lib.Utils")
local isEmptyObject = ____Utils.isEmptyObject
local objectEntries = ____Utils.objectEntries
local objectKeys = ____Utils.objectKeys
local ____HBasicObject = require("lib.ma_obj.HBasicObject")
local HBasicObject = ____HBasicObject.HBasicObject
local ____types = require("lib.ma_obj.types")
local ExecMode = ____types.ExecMode
function propsToString(self, props)
    local s = ""
    local index = 0
    for k, v in pairs(props) do
        assert(
            (string.find(k, " ", nil, true) or 0) - 1 < 0,
            "HObjectPool: setProp() propName may not have a space in it. propName: " .. ("\"" .. tostring(k)) .. "\""
        )
        s = s .. (index > 0 and " " or "") .. ((("'" .. tostring(k)) .. "' '") .. tostring(v)) .. "'"
        index = index + 1
    end
    return s
end
function toLuaPropValue(self, propType, propValue)
    repeat
        local ____switch72 = propType
        local ____cond72 = ____switch72 == "number"
        if ____cond72 then
            return propValue
        end
        ____cond72 = ____cond72 or ____switch72 == "string"
        if ____cond72 then
            return tostring(propValue)
        end
        ____cond72 = ____cond72 or ____switch72 == "color"
        if ____cond72 then
            return string.upper(propValue)
        end
        ____cond72 = ____cond72 or ____switch72 == "isVisible"
        if ____cond72 then
            return propValue == "Visible"
        end
        ____cond72 = ____cond72 or ____switch72 == "boolean"
        if ____cond72 then
            return propValue == "true"
        end
        do
            do
                error("HObject: toLuaPropValue() Unknown maPropType " .. tostring(propType))
            end
        end
    until true
end
function toCmdPropValue(self, propType, propValue)
    repeat
        local ____switch75 = propType
        local ____cond75 = ____switch75 == "number"
        if ____cond75 then
            return propValue
        end
        ____cond75 = ____cond75 or ____switch75 == "string"
        if ____cond75 then
            return tostring(propValue)
        end
        ____cond75 = ____cond75 or ____switch75 == "color"
        if ____cond75 then
            return string.upper(propValue)
        end
        ____cond75 = ____cond75 or ____switch75 == "isVisible"
        if ____cond75 then
            return propValue == true and "Visible" or "Hidden"
        end
        ____cond75 = ____cond75 or ____switch75 == "boolean"
        if ____cond75 then
            return propValue == true and "true" or "false"
        end
        do
            do
                error("HObject: toHPropValue() Unknown maPropType " .. tostring(propType))
            end
        end
    until true
end
--- Helper Pool Object base class
____exports.HObject = __TS__Class()
local HObject = ____exports.HObject
HObject.name = "HObject"
__TS__ClassExtends(HObject, HBasicObject)
function HObject.prototype.____constructor(self, addr, indexOrName, options)
    self.addr = addr
    self.indexOrName = indexOrName
    if options._getObj == nil and options._objCache == nil then
        error("Both _getObj and _objCache are undefined")
    end
    HBasicObject.prototype.____constructor(
        self,
        __TS__ObjectAssign({}, options, {_getObj = options._objCache ~= nil and options._objCache.getObj or options._getObj})
    )
    self.objCache = options._objCache
end
function HObject.prototype.getMAPropTypes(self)
    return {}
end
function HObject.prototype.getProps(self)
    local propTypes = self:getMAPropTypes()
    local props = {}
    for ____, propName in ipairs(objectKeys(nil, propTypes)) do
        props[propName] = toCmdPropValue(
            nil,
            propTypes[propName],
            self:getObj():Get(propName)
        )
    end
    return props
end
function HObject.prototype._getExecMode(self)
    return self._execMode == nil and (self.context == nil and ExecMode.CmdLine or self.context.execMode) or self._execMode
end
function HObject.prototype.setExecModeCmdLine(self)
    self._execMode = ExecMode.CmdLine
    return self
end
function HObject.prototype.setExecModeDirectLua(self)
    self._execMode = ExecMode.DirectLua
    return self
end
function HObject.prototype.isExecModeCmdLine(self)
    return self:_getExecMode() == ExecMode.CmdLine
end
function HObject.prototype.isExecModeDirectLua(self)
    return self:_getExecMode() == ExecMode.DirectLua
end
function HObject.prototype.exists(self)
    do
        local function ____catch()
            return true, false
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            self:getObj()
            return true, true
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch()
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function HObject.prototype.delete(self)
    if self:exists() then
        if self:isExecModeCmdLine() then
            self._cmd(("Delete " .. self.addr) .. " /nc")
        else
            local parent = self:getObj():Parent()
            local childIndex = getChildIndexById(nil, parent, self.indexOrName)
            if childIndex == nil then
                error(self.log:msg("delete(): could not find child with indexOrName =  " .. tostring(self.indexOrName)))
            else
                parent:Remove(childIndex)
            end
        end
    end
    local ____table_objCache_reset_result_0 = self.objCache
    if ____table_objCache_reset_result_0 ~= nil then
        ____table_objCache_reset_result_0 = ____table_objCache_reset_result_0:reset()
    end
    return self
end
function HObject.prototype.deleteThru(self, thruObj)
    self._cmd(((("Delete " .. self.addr) .. " Thru ") .. tostring(thruObj.indexOrName)) .. " /nc")
end
function HObject.prototype.deleteAllChildren(self)
    if self:isExecModeCmdLine() then
        if self:getObj():Count() > 0 then
            self._cmd(("Delete " .. self.addr) .. ".1 Thru /nc")
        end
    else
        local obj = self:getObj()
        while obj:Count() > 0 do
            obj:Remove(1)
        end
    end
end
function HObject.prototype.lock(self)
    self._cmd("Lock " .. self.addr)
    return self
end
function HObject.prototype.unlock(self)
    self._cmd("Unlock " .. self.addr)
    return self
end
function HObject.prototype.modeDirect(self)
    local context = self.context
    if context ~= nil then
        self.context = {
            undoBlock = context.undoBlock,
            hookManager = context.hookManager,
            execMode = ExecMode.DirectLua,
            of = context.of:duplicateDirectMode(),
            log = context.log
        }
    end
    return self
end
function HObject.prototype.move(self, destination)
    if self:isExecModeCmdLine() then
        self._cmd((("Move " .. self.addr) .. " At ") .. destination.addr)
    else
        self._cmd((("Move " .. self.addr) .. " At ") .. destination.addr)
        local ____table_context_log_4 = self.context
        if ____table_context_log_4 ~= nil then
            ____table_context_log_4 = ____table_context_log_4.log
        end
        local ____table_context_log_warn_result_2 = ____table_context_log_4
        if ____table_context_log_warn_result_2 ~= nil then
            ____table_context_log_warn_result_2 = ____table_context_log_warn_result_2:warn("HObject.move not supports DirectLua ExecMode. Using \"Cmd\"")
        end
    end
end
function HObject.prototype.store(self, options)
    local ____options_label_6 = options
    if ____options_label_6 ~= nil then
        ____options_label_6 = ____options_label_6.label
    end
    local label = ____options_label_6
    if self:isExecModeCmdLine() then
        local labelPart = label and ("\"" .. label) .. "\"" or ""
        self._cmd(((("Store " .. self.addr) .. " ") .. labelPart) .. " /nc")
    else
        if self:exists() then
            local obj = self:getObj()
            obj:CommandStore()
            if label ~= nil then
                obj.name = label
            end
        else
            local parent = self:getParent()
            if parent == nil then
                local msg = "store() directMode: can not find parent for address " .. self.addr
                error(self.log:msg(msg))
            else
                if type(self.indexOrName) == "string" then
                    local child = parent:Append(parent:GetChildClass())
                    child.name = self.indexOrName
                else
                    parent:Create(
                        self.indexOrName,
                        parent:GetChildClass()
                    )
                end
            end
        end
    end
    return self
end
function HObject.prototype.setLabel(self, label)
    assert(
        (string.find(label, "\"", nil, true) or 0) - 1 < 0,
        "setLabel(): label may not include a qoute character"
    )
    if self:isExecModeCmdLine() then
        self._cmd(((("Label " .. self.addr) .. " \"") .. label) .. "\" /nc")
    else
        self:getObj().name = label
    end
    return self
end
function HObject.prototype.setProp(self, propName, value)
    assert(
        (string.find(propName, " ", nil, true) or 0) - 1 < 0,
        "HObjectPool: setProp() propName may not have a space in it. propName: " .. ("\"" .. propName) .. "\""
    )
    self._cmd(((((("Set " .. self.addr) .. " ") .. String(nil, propName)) .. " '") .. tostring(value)) .. "'")
    return self
end
function HObject.prototype._getChangedProps(self, newProps, maPropTypes)
    local changedProps = {}
    local obj = self:getObj()
    for ____, propName in ipairs(objectKeys(nil, newProps)) do
        local objPropValue = obj:Get(propName)
        local maPropType = maPropTypes[propName]
        local newValue = toLuaPropValue(nil, maPropType, newProps[propName])
        if objPropValue ~= newValue then
            changedProps[propName] = newProps[propName]
        else
        end
    end
    return changedProps
end
function HObject.prototype.setProps(self, props)
    local maPropTypes = self:getMAPropTypes()
    if not isEmptyObject(nil, maPropTypes) then
        props = self:_getChangedProps(props, maPropTypes)
    end
    if self:isExecModeCmdLine() then
        self:doSetProps(props)
    else
        self:doSetPropsDirect(props)
    end
    return self
end
function HObject.prototype.doSetProps(self, props)
    if not isEmptyObject(nil, props) then
        self._cmd((("Set " .. self.addr) .. " ") .. propsToString(nil, props))
    end
    return self
end
function HObject.prototype.doSetPropsDirect(self, props)
    if not isEmptyObject(nil, props) then
        local maPropTypes = self:getMAPropTypes()
        for propName, propValue in objectEntries(props) do
            local maPropType = maPropTypes[propName]
            if maPropType == nil then
                error(((("HObject.doSetPropsDirect() " .. self.addr) .. ": propName \"") .. propName) .. "\" is not defined in maPropTypes")
            end
            self:getObj():Set(
                propName,
                toLuaPropValue(nil, maPropType, propValue)
            )
        end
    end
    return self
end
function HObject.prototype.assignTo(self, target)
    self._cmd((("Assign " .. self.addr) .. " At ") .. target.addr)
    return self
end
function HObject.prototype.setObjectProp(self, propName, hValue)
    local thisObj = self:getObj()
    local curValue = thisObj:Get(propName)
    local newValue = hValue:getObj()
    if newValue ~= curValue then
        thisObj:Set(propName, newValue)
    end
    return self
end
function HObject.prototype.isLocked(self)
    return self:getObj():Get("lock") == "Yes"
end
function HObject.prototype.setLocked(self, lock)
    self:getObj():Set("lock", lock and "Yes" or "No")
end
return ____exports
 end,
["lib.ma_obj.HPreset"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local fromAddr = ____MAUtils.fromAddr
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
____exports.PresetFamily = PresetFamily or ({})
____exports.PresetFamily.Dimmer = 1
____exports.PresetFamily[____exports.PresetFamily.Dimmer] = "Dimmer"
____exports.PresetFamily.Position = 2
____exports.PresetFamily[____exports.PresetFamily.Position] = "Position"
____exports.PresetFamily.Gobo = 3
____exports.PresetFamily[____exports.PresetFamily.Gobo] = "Gobo"
____exports.PresetFamily.Color = 4
____exports.PresetFamily[____exports.PresetFamily.Color] = "Color"
____exports.PresetFamily.Beam = 5
____exports.PresetFamily[____exports.PresetFamily.Beam] = "Beam"
____exports.PresetFamily.Focus = 6
____exports.PresetFamily[____exports.PresetFamily.Focus] = "Focus"
____exports.PresetFamily.Control = 7
____exports.PresetFamily[____exports.PresetFamily.Control] = "Control"
____exports.PresetFamily.Shapers = 8
____exports.PresetFamily[____exports.PresetFamily.Shapers] = "Shapers"
____exports.PresetFamily.Video = 9
____exports.PresetFamily[____exports.PresetFamily.Video] = "Video"
____exports.PresetFamily.All1 = 21
____exports.PresetFamily[____exports.PresetFamily.All1] = "All1"
____exports.PresetFamily.All2 = 22
____exports.PresetFamily[____exports.PresetFamily.All2] = "All2"
____exports.PresetFamily.All3 = 23
____exports.PresetFamily[____exports.PresetFamily.All3] = "All3"
____exports.PresetFamily.All4 = 24
____exports.PresetFamily[____exports.PresetFamily.All4] = "All4"
____exports.PresetFamily.All5 = 25
____exports.PresetFamily[____exports.PresetFamily.All5] = "All5"
local HPreset = __TS__Class()
HPreset.name = "HPreset"
__TS__ClassExtends(HPreset, HObject)
function HPreset.prototype.____constructor(self, presetFamily, id, context)
    local addr = buildAddress(nil, "Preset", presetFamily, id)
    HObject.prototype.____constructor(
        self,
        addr,
        id,
        {
            context = context,
            _getObj = function() return fromAddr(nil, addr) end
        }
    )
end
____exports.HPreset = HPreset
return ____exports
 end,
["lib.MAPoolsInfo"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.MAX_OBJECTS_LARGE_POOL = 9999
____exports.MAX_OBJECTS_1024 = 1024
____exports.MAX_OBJECTS_160 = 160
____exports.MAX_OBJECTS_SMALL_POOL = 128
local function getPoolById(self, poolId, poolInfos)
    for ____, pool in ipairs(poolInfos) do
        if pool.id == poolId then
            return pool
        end
    end
    error("Could not get MAPoolInfo by poolId=" .. poolId)
end
local function getPoolConfigByKeyword(self, keyword, poolsConfig)
    local pc = {}
    for ____, pool in ipairs(poolsConfig) do
        if pool.keyword == keyword then
            pc[#pc + 1] = pool
        end
    end
    return pc
end
____exports.PoolInfo = __TS__Class()
local PoolInfo = ____exports.PoolInfo
PoolInfo.name = "PoolInfo"
function PoolInfo.prototype.____constructor(self, params)
    self.params = params
end
__TS__SetDescriptor(
    PoolInfo.prototype,
    "id",
    {get = function(self)
        return self.params.id
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "poolDefaultObjName",
    {get = function(self)
        return self.params.poolDefaultObjName
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "label",
    {get = function(self)
        return self.params.label
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "shortLabel",
    {get = function(self)
        return self.params.shortLabel
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "keyword",
    {get = function(self)
        return self.params.keyword
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "windowType",
    {get = function(self)
        return self.params.windowType
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "windowPresetPoolType",
    {get = function(self)
        local ____temp_0
        if self.params.subPoolIndex == nil then
            ____temp_0 = nil
        else
            ____temp_0 = self.params.subPoolIndex - 1
        end
        return ____temp_0
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "maxObjects",
    {get = function(self)
        return self.params.maxObjects
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "childKeyword",
    {get = function(self)
        return self.params.childKeyword
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "subPoolLabel",
    {get = function(self)
        return self.params.subPoolLabel
    end},
    true
)
__TS__SetDescriptor(
    PoolInfo.prototype,
    "subPoolIndex",
    {get = function(self)
        return self.params.subPoolIndex
    end},
    true
)
function PoolInfo.prototype.exists(self, parent)
    return self:getPoolObject(parent) ~= nil
end
function PoolInfo.prototype.getPoolObject(self, parent)
    return self.params:getPoolObject(parent)
end
function PoolInfo.prototype.getDefaultParent(self)
    return self.params:getDefaultParent()
end
function PoolInfo.prototype.getAddress(self, index)
    local ____self_params_1 = self.params
    local keyword = ____self_params_1.keyword
    local subPoolIndex = ____self_params_1.subPoolIndex
    return ((keyword .. " ") .. (subPoolIndex == nil and "" or tostring(subPoolIndex) .. ".")) .. tostring(index)
end
local all = {
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Appearances",
            poolDefaultObjName = "Appearance",
            label = "Appearances",
            shortLabel = "APP",
            getPoolObject = function(____, parent)
                return Root().ShowData.Appearances
            end,
            getDefaultParent = function() return Root().ShowData end,
            keyword = "Appearance",
            windowType = "WindowAppearancePool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Cameras",
            poolDefaultObjName = "Camera",
            label = "Cameras",
            shortLabel = "Cam",
            getPoolObject = function(____, parent)
                local ____parent_2 = parent
                if ____parent_2 == nil then
                    ____parent_2 = CurrentProfile()
                end
                return ____parent_2.Cameras
            end,
            getDefaultParent = function() return CurrentProfile() end,
            keyword = "Camera",
            windowType = "WindowCameraPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Configs",
            poolDefaultObjName = "Configuration",
            label = "Configs",
            shortLabel = "Cnf",
            getPoolObject = function(____, parent)
                local ____parent_3 = parent
                if ____parent_3 == nil then
                    ____parent_3 = DataPool()
                end
                return ____parent_3.Configurations
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Config",
            windowType = "WindowConfigurationPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "DataPools",
            poolDefaultObjName = "DataPool",
            label = "Data Pools",
            shortLabel = "DPL",
            getPoolObject = function(____, parent)
                return Root().ShowData.DataPools
            end,
            getDefaultParent = function() return Root().ShowData end,
            keyword = "DataPool",
            windowType = "WindowDataPool",
            maxObjects = ____exports.MAX_OBJECTS_SMALL_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "DmxUniverses",
            poolDefaultObjName = "Universes",
            label = "Dmx Universes",
            shortLabel = "Uni",
            getPoolObject = function()
                return Root().ShowData.LivePatch.DmxUniverses
            end,
            getDefaultParent = function() return Root().ShowData.LivePatch end,
            keyword = "DMXUniverse",
            windowType = "WindowUniversePool",
            maxObjects = ____exports.MAX_OBJECTS_1024
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Filters",
            poolDefaultObjName = "Filter",
            label = "Filters",
            shortLabel = "FLT",
            getPoolObject = function(____, parent)
                local ____parent_4 = parent
                if ____parent_4 == nil then
                    ____parent_4 = DataPool()
                end
                return ____parent_4.Filters
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Filter",
            windowType = "WindowFilterPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Gels.MA",
            poolDefaultObjName = "Gels",
            label = "Gels [MA]",
            shortLabel = "GMA",
            subPoolLabel = "MA",
            getPoolObject = function()
                return Root().ShowData.GelPools.MA
            end,
            getDefaultParent = function() return Root().ShowData.GelPools end,
            keyword = "Gel",
            subPoolIndex = 1,
            windowType = "WindowGelPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Gobos",
            poolDefaultObjName = "Gobo",
            label = "Gobos",
            shortLabel = "GOB",
            getPoolObject = function(____, parent)
                return Root().ShowData.MediaPools.Gobos
            end,
            getDefaultParent = function()
                return Root().ShowData.MediaPools
            end,
            keyword = "Gobo",
            subPoolIndex = 1,
            windowType = "WindowGoboPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Groups",
            poolDefaultObjName = "Group",
            label = "Groups",
            shortLabel = "GRP",
            getPoolObject = function(____, parent)
                local ____parent_5 = parent
                if ____parent_5 == nil then
                    ____parent_5 = DataPool()
                end
                return ____parent_5.Groups
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Group",
            windowType = "WindowGroupPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Images",
            poolDefaultObjName = "Image",
            label = "Images",
            shortLabel = "IMG",
            getPoolObject = function(____, parent)
                return Root().ShowData.MediaPools.Images
            end,
            getDefaultParent = function()
                return Root().ShowData.MediaPools
            end,
            keyword = "Image",
            subPoolIndex = 3,
            windowType = "WindowImagePool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Layouts",
            poolDefaultObjName = "Layouts",
            label = "Layouts",
            shortLabel = "LAY",
            getPoolObject = function(____, parent)
                local ____parent_6 = parent
                if ____parent_6 == nil then
                    ____parent_6 = DataPool()
                end
                return ____parent_6.Layouts
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Layout",
            windowType = "WindowLayoutPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Macros",
            poolDefaultObjName = "Macro",
            label = "Macros",
            shortLabel = "MAC",
            getPoolObject = function(____, parent)
                local ____parent_7 = parent
                if ____parent_7 == nil then
                    ____parent_7 = DataPool()
                end
                return ____parent_7.Macros
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Macro",
            windowType = "WindowMacroPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "MAtricks",
            poolDefaultObjName = "Matricks",
            label = "MAtricks",
            shortLabel = "MAT",
            getPoolObject = function(____, parent)
                local ____parent_8 = parent
                if ____parent_8 == nil then
                    ____parent_8 = DataPool()
                end
                return ____parent_8.MAtricks
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "MAtrick",
            windowType = "WindowMatricksPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Meshes",
            poolDefaultObjName = "Mesh",
            label = "Meshes",
            shortLabel = "Msh",
            getPoolObject = function()
                return Root().ShowData.Meshes
            end,
            getDefaultParent = function() return Root().ShowData end,
            keyword = "Mesh",
            windowType = "WindowMeshPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Pages",
            poolDefaultObjName = "Page",
            label = "Pages",
            shortLabel = "PAG",
            getPoolObject = function(____, parent)
                local ____parent_9 = parent
                if ____parent_9 == nil then
                    ____parent_9 = DataPool()
                end
                return ____parent_9.Pages
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Page",
            windowType = "WindowPagePool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Plugins",
            poolDefaultObjName = "Plugin",
            label = "Plugins",
            shortLabel = "PLG",
            getPoolObject = function(____, parent)
                local ____parent_10 = parent
                if ____parent_10 == nil then
                    ____parent_10 = DataPool()
                end
                return ____parent_10.Plugins
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Plugin",
            windowType = "WindowPluginPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Dimmer",
            poolDefaultObjName = "Preset",
            label = "Presets [Dimmer]",
            shortLabel = "DIM",
            subPoolLabel = "Dimmer",
            getPoolObject = function(____, parent)
                local ____parent_11 = parent
                if ____parent_11 == nil then
                    ____parent_11 = DataPool()
                end
                return ____parent_11.PresetPools.Dimmer
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 1,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Position",
            poolDefaultObjName = "Preset",
            label = "Presets [Position]",
            shortLabel = "POS",
            subPoolLabel = "Position",
            getPoolObject = function(____, parent)
                local ____parent_12 = parent
                if ____parent_12 == nil then
                    ____parent_12 = DataPool()
                end
                return ____parent_12.PresetPools.Position
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 2,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Gobo",
            poolDefaultObjName = "Preset",
            label = "Presets [Gobo]",
            shortLabel = "GOB",
            subPoolLabel = "Gobo",
            getPoolObject = function(____, parent)
                local ____parent_13 = parent
                if ____parent_13 == nil then
                    ____parent_13 = DataPool()
                end
                return ____parent_13.PresetPools.Gobo
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 3,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Color",
            poolDefaultObjName = "Preset",
            label = "Presets [Color]",
            shortLabel = "COL",
            subPoolLabel = "Color",
            getPoolObject = function(____, parent)
                local ____parent_14 = parent
                if ____parent_14 == nil then
                    ____parent_14 = DataPool()
                end
                return ____parent_14.PresetPools.Color
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 4,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Beam",
            poolDefaultObjName = "Preset",
            label = "Presets [Beam]",
            shortLabel = "BEM",
            subPoolLabel = "Beam",
            getPoolObject = function(____, parent)
                local ____parent_15 = parent
                if ____parent_15 == nil then
                    ____parent_15 = DataPool()
                end
                return ____parent_15.PresetPools.Beam
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 5,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Focus",
            poolDefaultObjName = "Preset",
            label = "Presets [Focus]",
            shortLabel = "FOC",
            subPoolLabel = "Focus",
            getPoolObject = function(____, parent)
                local ____parent_16 = parent
                if ____parent_16 == nil then
                    ____parent_16 = DataPool()
                end
                return ____parent_16.PresetPools.Focus
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 6,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Control",
            poolDefaultObjName = "Preset",
            label = "Presets [Control]",
            shortLabel = "CTL",
            subPoolLabel = "Control",
            getPoolObject = function(____, parent)
                local ____parent_17 = parent
                if ____parent_17 == nil then
                    ____parent_17 = DataPool()
                end
                return ____parent_17.PresetPools.Control
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 7,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Shapers",
            poolDefaultObjName = "Preset",
            label = "Presets [Shapers]",
            shortLabel = "SHP",
            subPoolLabel = "Shapers",
            getPoolObject = function(____, parent)
                local ____parent_18 = parent
                if ____parent_18 == nil then
                    ____parent_18 = DataPool()
                end
                return ____parent_18.PresetPools.Shapers
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 8,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.Video",
            poolDefaultObjName = "Preset",
            label = "Presets [Video]",
            shortLabel = "VID",
            subPoolLabel = "Video",
            getPoolObject = function(____, parent)
                local ____parent_19 = parent
                if ____parent_19 == nil then
                    ____parent_19 = DataPool()
                end
                return ____parent_19.PresetPools.Video
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 9,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.All 1",
            poolDefaultObjName = "Preset",
            label = "Presets [All 1]",
            shortLabel = "AL1",
            subPoolLabel = "All 1",
            getPoolObject = function(____, parent)
                local ____parent_20 = parent
                if ____parent_20 == nil then
                    ____parent_20 = DataPool()
                end
                return ____parent_20.PresetPools["All 1"]
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 21,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.All 2",
            poolDefaultObjName = "Preset",
            label = "Presets [All 2]",
            shortLabel = "AL2",
            subPoolLabel = "All 2",
            getPoolObject = function(____, parent)
                local ____parent_21 = parent
                if ____parent_21 == nil then
                    ____parent_21 = DataPool()
                end
                return ____parent_21.PresetPools["All 2"]
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 22,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.All 3",
            poolDefaultObjName = "Preset",
            label = "Presets [All 3]",
            shortLabel = "AL3",
            subPoolLabel = "All 3",
            getPoolObject = function(____, parent)
                local ____parent_22 = parent
                if ____parent_22 == nil then
                    ____parent_22 = DataPool()
                end
                return ____parent_22.PresetPools["All 3"]
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 23,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.All 4",
            poolDefaultObjName = "Preset",
            label = "Presets [All 4]",
            shortLabel = "AL4",
            subPoolLabel = "All 4",
            getPoolObject = function(____, parent)
                local ____parent_23 = parent
                if ____parent_23 == nil then
                    ____parent_23 = DataPool()
                end
                return ____parent_23.PresetPools["All 4"]
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 24,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Presets.All 5",
            poolDefaultObjName = "Preset",
            label = "Presets [All 5]",
            shortLabel = "AL5",
            subPoolLabel = "All 5",
            getPoolObject = function(____, parent)
                local ____parent_24 = parent
                if ____parent_24 == nil then
                    ____parent_24 = DataPool()
                end
                return ____parent_24.PresetPools["All 5"]
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Preset",
            subPoolIndex = 25,
            windowType = "WindowPresetPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "RenderQualities",
            poolDefaultObjName = "RenderQuality",
            label = "Render Qualities",
            shortLabel = "RnQ",
            getPoolObject = function(____, parent)
                local ____parent_25 = parent
                if ____parent_25 == nil then
                    ____parent_25 = CurrentProfile()
                end
                return ____parent_25.RenderQualities
            end,
            getDefaultParent = function() return CurrentProfile() end,
            keyword = "RenderQuality",
            windowType = "WindowRenderQualityPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Scribbles",
            poolDefaultObjName = "Scribble",
            label = "Scribbles",
            shortLabel = "Scb",
            getPoolObject = function()
                return Root().ShowData.Scribbles
            end,
            getDefaultParent = function() return Root().ShowData end,
            keyword = "Scribble",
            windowType = "WindowScribblePool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Sequences",
            poolDefaultObjName = "Sequence",
            label = "Sequences",
            shortLabel = "SEQ",
            getPoolObject = function(____, parent)
                local ____parent_26 = parent
                if ____parent_26 == nil then
                    ____parent_26 = DataPool()
                end
                return ____parent_26.Sequences
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Sequence",
            childKeyword = "Cue",
            windowType = "WindowSequencePool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Sounds",
            poolDefaultObjName = "Sounds",
            label = "Sounds",
            shortLabel = "Snd",
            getPoolObject = function(____, parent)
                return Root().ShowData.MediaPools.Sounds
            end,
            getDefaultParent = function()
                return Root().ShowData.MediaPools
            end,
            keyword = "Sound",
            windowType = "WindowSoundPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Symbols",
            poolDefaultObjName = "Symbol",
            label = "Symbols",
            shortLabel = "GOB",
            getPoolObject = function(____, parent)
                return Root().ShowData.MediaPools.Symbols
            end,
            getDefaultParent = function()
                return Root().ShowData.MediaPools
            end,
            keyword = "Symbol",
            subPoolIndex = 2,
            windowType = "WindowSymbolPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Timecodes",
            poolDefaultObjName = "Timecodes",
            label = "Timecodes",
            shortLabel = "TCD",
            getPoolObject = function(____, parent)
                local ____parent_27 = parent
                if ____parent_27 == nil then
                    ____parent_27 = DataPool()
                end
                return ____parent_27.Timecodes
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "Timecode",
            windowType = "WindowTimecodePool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "TimecodeSlots",
            poolDefaultObjName = "Timecodes",
            label = "Timecode Slots",
            shortLabel = "TCS",
            getPoolObject = function()
                return Root().TimecodeSlots
            end,
            getDefaultParent = function() return Root() end,
            keyword = "TimecodeSlot",
            windowType = "WindowTimecodeSlotPool",
            maxObjects = ____exports.MAX_OBJECTS_160
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Users",
            poolDefaultObjName = "Users",
            label = "Users",
            shortLabel = "Usr",
            getPoolObject = function(____, parent)
                return Root().ShowData.Users
            end,
            getDefaultParent = function() return Root().ShowData end,
            keyword = "User",
            windowType = "WindowUserPool",
            maxObjects = ____exports.MAX_OBJECTS_SMALL_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Videos",
            poolDefaultObjName = "Video",
            label = "Videos",
            shortLabel = "Vid",
            getPoolObject = function(____, parent)
                return Root().ShowData.MediaPools.Videos
            end,
            getDefaultParent = function()
                return Root().ShowData.MediaPools
            end,
            keyword = "Video",
            windowType = "WindowVideoPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Views",
            poolDefaultObjName = "View",
            label = "Views",
            shortLabel = "VIW",
            getPoolObject = function(____, parent)
                local ____parent_28 = parent
                if ____parent_28 == nil then
                    ____parent_28 = CurrentProfile()
                end
                return ____parent_28.Views
            end,
            getDefaultParent = function() return CurrentProfile() end,
            keyword = "View",
            windowType = "WindowViewPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    ),
    __TS__New(
        ____exports.PoolInfo,
        {
            id = "Worlds",
            poolDefaultObjName = "World",
            label = "Worlds",
            shortLabel = "WRD",
            getPoolObject = function(____, parent)
                local ____parent_29 = parent
                if ____parent_29 == nil then
                    ____parent_29 = DataPool()
                end
                return ____parent_29.Worlds
            end,
            getDefaultParent = function() return DataPool() end,
            keyword = "World",
            windowType = "WindowWorldPool",
            maxObjects = ____exports.MAX_OBJECTS_LARGE_POOL
        }
    )
}
local byId = __TS__ArrayReduce(
    all,
    function(____, poolsById, poolInfo)
        poolsById[poolInfo.id] = poolInfo
        return poolsById
    end,
    {}
)
function ____exports.MAPoolsInfo(self)
    local function byPresetFamily(self, presetFamily)
        return __TS__ArrayFind(
            all,
            function(____, p) return p.keyword == "Preset" and p.subPoolIndex == presetFamily end
        ).id
    end
    return {
        byId = function(____, poolId) return byId[poolId] end,
        byKeyword = function(____, keyword) return getPoolConfigByKeyword(nil, keyword, all) end,
        byPresetFamily = byPresetFamily,
        allPools = all
    }
end
return ____exports
 end,
["lib.ma_obj.HCue"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local getZeroBasedChildIndexByCueNumberOrName
local ____MAUtils = require("lib.MAUtils")
local buildMultiKeywordAddress = ____MAUtils.buildMultiKeywordAddress
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
function getZeroBasedChildIndexByCueNumberOrName(self, parent, cueNumberOrName)
    local children = parent:Children()
    if type(cueNumberOrName) == "string" then
        do
            local i = -1
            while i < #children do
                local obj = children[i + 1]
                if obj ~= nil and obj.name == cueNumberOrName then
                    return i
                end
                i = i + 1
            end
        end
    else
        do
            local i = -1
            while i < #children do
                local obj = children[i + 1]
                if obj ~= nil and obj.no == cueNumberOrName * 1000 then
                    return i
                end
                i = i + 1
            end
        end
    end
    return nil
end
____exports.HCue = __TS__Class()
local HCue = ____exports.HCue
HCue.name = "HCue"
__TS__ClassExtends(HCue, HObject)
function HCue.prototype.____constructor(self, seqNumberOrName, cueNumberOrName, context)
    self.cueNumberOrName = cueNumberOrName
    local addr = buildMultiKeywordAddress(
        nil,
        "Sequence",
        seqNumberOrName,
        "Cue",
        cueNumberOrName
    )
    local function _getParent()
        return DataPool().Sequences[seqNumberOrName]
    end
    HObject.prototype.____constructor(
        self,
        addr,
        cueNumberOrName,
        {
            context = context,
            _getParent = _getParent,
            _getObj = function()
                local seq = _getParent(nil)
                if seq ~= nil then
                    local childIndex = getZeroBasedChildIndexByCueNumberOrName(nil, seq, cueNumberOrName)
                    if childIndex ~= nil then
                        return seq:Children()[childIndex + 1]
                    end
                end
                return nil
            end
        }
    )
end
function HCue.prototype.getCueNumber(self)
    return self:getObj().no / 1000
end
function HCue.prototype.getAppearance(self)
    local appearanceObj = self:getObj():Children()[1].appearance
    local ____temp_0
    if appearanceObj == nil then
        ____temp_0 = nil
    else
        ____temp_0 = self.context.of:HAppearance(appearanceObj.index)
    end
    return ____temp_0
end
function HCue.prototype.setAppearance(self, appearance)
    if appearance == nil then
        self._cmd(("Set  " .. self.addr) .. " Part 0 Property Appearance None")
    else
        appearance:assignTo(self)
    end
end
function HCue.prototype.setLabel(self, label)
    self._cmd(((("Label " .. self.addr) .. " \"") .. label) .. "\"")
    return self
end
function HCue.prototype.setCommand(self, command)
    self._cmd(((("Set " .. self.addr) .. " command='") .. command) .. "'")
    return self
end
function HCue.prototype.load(self)
    self._cmd("Load " .. self.addr)
end
function HCue.prototype.go(self)
    self._cmd("Go " .. self.addr)
end
function HCue.prototype.delete(self)
    if self:exists() then
        if self:isExecModeCmdLine() then
            self._cmd(("Delete " .. self.addr) .. " /nc")
        else
            local parent = self:getObj():Parent()
            local childIndex = getZeroBasedChildIndexByCueNumberOrName(nil, parent, self.indexOrName)
            if childIndex == nil then
                error(self.log:msg("delete(): could not find cue with indexOrName =  " .. tostring(self.indexOrName)))
            else
                parent:Remove(childIndex + 1)
            end
        end
    end
    return self
end
function HCue.prototype.store(self, options)
    local ____options_label_1 = options
    if ____options_label_1 ~= nil then
        ____options_label_1 = ____options_label_1.label
    end
    local label = ____options_label_1
    if self:isExecModeCmdLine() then
        return HObject.prototype.store(self, options)
    else
        error("store(): Cue store not supported in direct LUA mode")
    end
end
return ____exports
 end,
["lib.DisplayUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
--- Get the window area size in cells.
-- More percisly, it return the size in whole-cells that fit in the screen.
-- (Meaning that there could be 0.5 a cell extra)
-- 
-- This takes into consideration wether the cmdBar, viewBar, encoderBVar or cmdLineBar are shown or not,
-- and also works for different scaleRatios.
local function getWindowAreaSize(self, displayHandle)
    local rows = displayHandle[1]:Children()
    local columns = displayHandle[2]:Children()
    local windowAreaSizePx = {
        w = columns[2]:Get("REALSIZE"),
        h = rows[1]:Get("REALSIZE") + rows[2]:Get("REALSIZE")
    }
    return {
        w = math.floor(windowAreaSizePx.w / 100),
        h = math.floor(windowAreaSizePx.h / 100)
    }
end
____exports.DisplayUtils = {getWindowAreaSize = getWindowAreaSize}
return ____exports
 end,
["lib.ma_obj.HDisplay"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____DisplayUtils = require("lib.DisplayUtils")
local DisplayUtils = ____DisplayUtils.DisplayUtils
local ____HBasicObject = require("lib.ma_obj.HBasicObject")
local HBasicObject = ____HBasicObject.HBasicObject
local HDisplay = __TS__Class()
HDisplay.name = "HDisplay"
__TS__ClassExtends(HDisplay, HBasicObject)
function HDisplay.prototype.____constructor(self, screenNumber, context)
    HBasicObject.prototype.____constructor(
        self,
        {
            context = context,
            _getObj = function() return GetDisplayByIndex(screenNumber) end
        }
    )
    self.screenNumber = screenNumber
end
function HDisplay.prototype.getWindowAreaSize(self)
    return DisplayUtils:getWindowAreaSize(self:getObj())
end
function HDisplay.prototype.exists(self)
    return self:_getObj() ~= nil
end
____exports.HDisplay = HDisplay
return ____exports
 end,
["lib.ma_obj.HSequence"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFindIndex = ____lualib.__TS__ArrayFindIndex
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local ____HCue = require("lib.ma_obj.HCue")
local HCue = ____HCue.HCue
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____common = require("lib.ma_obj.common")
local ObjCache = ____common.ObjCache
local HSequenceMAPropTypes = {restartMode = "string"}
--- The CueZero and OffCue
local NUM_OF_INTERNAL_CUES = 2
____exports.HSequence = __TS__Class()
local HSequence = ____exports.HSequence
HSequence.name = "HSequence"
__TS__ClassExtends(HSequence, HObject)
function HSequence.prototype.____constructor(self, idOrName, context)
    local addr = buildAddress(nil, "Sequence", idOrName)
    HObject.prototype.____constructor(
        self,
        addr,
        idOrName,
        {
            context = context,
            _objCache = ObjCache(
                nil,
                DataPool().Sequences,
                idOrName
            )
        }
    )
end
function HSequence.prototype.getMAPropTypes(self)
    return HSequenceMAPropTypes
end
function HSequence.prototype.store(self, options)
    local ____options_0 = options
    local label = ____options_0.label
    local optionsMode = ____options_0.mode
    local labelPart = label == nil and "" or ("\"" .. label) .. "\""
    local mode = optionsMode == nil and "CreateSecondCue" or optionsMode
    self._cmd((((("Store " .. self.addr) .. " ") .. labelPart) .. " /") .. mode)
    return self
end
function HSequence.prototype.delete(self)
    return HObject.prototype.delete(self)
end
function HSequence.prototype.storeEmpty(self)
    if self:exists() then
        error(("storeEmpty(): sequence " .. tostring(self.indexOrName)) .. " already exists")
    end
    self._cmd(("Store " .. self.addr) .. " Cue \"\" /nc")
    return self
end
function HSequence.prototype.setLocked(self, locked)
    self._cmd((("Set " .. self.addr) .. " \"lock\" ") .. (locked and "true" or "false"))
end
function HSequence.prototype.getCue(self, cueNumberOrName)
    return __TS__New(HCue, self.indexOrName, cueNumberOrName, self.context)
end
function HSequence.prototype.getOffCue(self)
    return __TS__New(HCue, self.indexOrName, "OffCue", self.context)
end
function HSequence.prototype.storeCue(self, cueNumber, options)
    local ____temp_5
    local ____options_label_1 = options
    if ____options_label_1 ~= nil then
        ____options_label_1 = ____options_label_1.label
    end
    if ____options_label_1 == nil then
        ____temp_5 = ""
    else
        local ____options_label_3 = options
        if ____options_label_3 ~= nil then
            ____options_label_3 = ____options_label_3.label
        end
        ____temp_5 = ("\"" .. ____options_label_3) .. "\""
    end
    local labelPart = ____temp_5
    local ____options_mode_6 = options
    if ____options_mode_6 ~= nil then
        ____options_mode_6 = ____options_mode_6.mode
    end
    local mode = ____options_mode_6 == nil and "Merge" or options.mode
    local cueAddr = (self.addr .. " Cue ") .. tostring(cueNumber)
    self._cmd((((("Store " .. cueAddr) .. " ") .. labelPart) .. " /") .. mode)
    return __TS__New(HCue, self.indexOrName, cueNumber, self.context)
end
function HSequence.prototype.setOffWhenOverride(self, value)
    self._cmd((("Set " .. self.addr) .. " \"offwhenoverridden\" ") .. (value and "true" or "false"))
    return self
end
function HSequence.prototype.getNumOfCues(self)
    return self:getObj():Count() - 2
end
function HSequence.prototype.getCues(self)
    local children = self:getObj():Children()
    local cues = {}
    do
        local childIndex = 2
        while childIndex < #children do
            local cue = children[childIndex + 1]
            cues[#cues + 1] = __TS__New(HCue, self.indexOrName, cue.no / 1000, self.context)
            childIndex = childIndex + 1
        end
    end
    return cues
end
function HSequence.prototype.getActiveCue(self)
    local curChild = self:getObj():CurrentChild()
    local ____temp_8
    if curChild == nil then
        ____temp_8 = nil
    else
        ____temp_8 = __TS__New(HCue, self.indexOrName, curChild.index, self.context)
    end
    return ____temp_8
end
function HSequence.prototype.getActiveCueChildIndex(self)
    local seqObj = self:getObj()
    local activeChild = seqObj:CurrentChild()
    if activeChild == nil then
        return nil
    end
    return __TS__ArrayFindIndex(
        seqObj:Children(),
        function(____, c) return c == activeChild end
    )
end
function HSequence.prototype.getActiveCueOrdinal(self)
    local seqObj = self:getObj()
    local activeChild = seqObj:CurrentChild()
    if activeChild == nil then
        return nil
    end
    return __TS__ArrayFindIndex(
        seqObj:Children(),
        function(____, c) return c == activeChild end
    ) - NUM_OF_INTERNAL_CUES + 1
end
function HSequence.prototype.getFaderValue(self, token, index)
    return self:getObj():GetFader({token = token, index = index})
end
function HSequence.prototype.isActive(self)
    return self:exists() and self:getActiveCue() ~= nil
end
function HSequence.prototype.off(self, options)
    local ____options_fadeSec_9 = options
    if ____options_fadeSec_9 ~= nil then
        ____options_fadeSec_9 = ____options_fadeSec_9.fadeSec
    end
    local fadePart = ____options_fadeSec_9 == nil and "" or "fade " .. tostring(options.fadeSec)
    self._cmd((("Off " .. self.addr) .. " ") .. fadePart)
    return self
end
function HSequence.prototype.deleteAllCues(self)
    self._cmd(("Delete " .. self.addr) .. " Cue 1 Thru /nc")
end
function HSequence.prototype.clone(self, targetId)
    self._cmd(((("Copy " .. self.addr) .. " At Seq ") .. tostring(targetId)) .. " /o")
    return __TS__New(____exports.HSequence, targetId, self.context)
end
return ____exports
 end,
["lib.ma_obj.HExecutor"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local faderModeToKeyword
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local getChildByIndex = ____MAUtils.getChildByIndex
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____HSequence = require("lib.ma_obj.HSequence")
local HSequence = ____HSequence.HSequence
function ____exports.describeExecId(self, execId)
    return ((("[" .. tostring(execId.page)) .. ".") .. tostring(execId.index)) .. "]"
end
function ____exports.parseExecId(self, id)
    local numberParts = __TS__ArrayMap(
        __TS__StringSplit(id, "."),
        function(____, s) return __TS__ParseInt(s) end
    )
    return {page = numberParts[1], index = numberParts[2]}
end
local HExecutor = __TS__Class()
HExecutor.name = "HExecutor"
__TS__ClassExtends(HExecutor, HObject)
function HExecutor.prototype.____constructor(self, execId, context)
    local _id = type(execId) == "string" and ____exports.parseExecId(nil, execId) or execId
    local addr = _id.page == nil and buildAddress(nil, "Exec", _id.index) or buildAddress(nil, "Page", _id.page, _id.index)
    local function _getObj()
        if _id.page == nil then
            local currentPageIndex = 1
            local pageObj = getChildByIndex(
                nil,
                DataPool().Pages,
                currentPageIndex
            )
            return getChildByIndex(nil, pageObj, _id.index)
        else
            local pageObj = getChildByIndex(
                nil,
                DataPool().Pages,
                _id.page
            )
            if pageObj == nil then
                error(
                    __TS__New(Error, "Object not found"),
                    0
                )
            end
            return getChildByIndex(nil, pageObj, _id.index)
        end
    end
    HObject.prototype.____constructor(self, addr, _id.index, {context = context, _getObj = _getObj})
    self.execId = _id
end
function HExecutor.prototype.isAssigned(self)
    local obj = self:getObj()
    return self:getObj():Get("OBJECT") ~= nil
end
function HExecutor.prototype.isTargetSequence(self)
    return self:getObj():Get("OBJECT"):GetClass() == "Sequence"
end
function HExecutor.prototype.getTargetSequence(self)
    return __TS__New(
        HSequence,
        self:getObj():Get("OBJECT").index,
        self.context
    )
end
function HExecutor.prototype.setFaderMode(self, mode)
    self._cmd((("Assign " .. faderModeToKeyword[mode]) .. " At ") .. self.addr)
    return self
end
function HExecutor.prototype.setKey(self, key)
    self._cmd((("Assign " .. key) .. " At ") .. self.addr)
    return self
end
function HExecutor.prototype.getFaderValue(self)
    return self:getObj():GetFader({})
end
function HExecutor.prototype.setFaderValue(self, value)
    return self:getObj():SetFader({value = value})
end
function HExecutor.prototype.describe(self)
    return ____exports.describeExecId(nil, self.execId)
end
____exports.HExecutor = HExecutor
faderModeToKeyword = {Master = "FaderMaster", Temp = "FaderTemp"}
local MAX_EXEC_COLUMN_INDEX = 85
function ____exports.nextEmptyExec(self, startExecId, options)
    local index = startExecId.index
    local colmnIndex = index % 100
    repeat
        do
            local execId = {page = startExecId.page, index = index}
            if not __TS__New(HExecutor, execId, options):exists() then
                return execId
            end
            index = index + 1
        end
    until not (index % 100 < MAX_EXEC_COLUMN_INDEX)
    return -1
end
return ____exports
 end,
["lib.ma_obj.HGroup"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local fromAddr = ____MAUtils.fromAddr
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local HGroup = __TS__Class()
HGroup.name = "HGroup"
__TS__ClassExtends(HGroup, HObject)
function HGroup.prototype.____constructor(self, id, context)
    local addr = buildAddress(nil, "Group", id)
    HObject.prototype.____constructor(
        self,
        addr,
        id,
        {
            context = context,
            _getObj = function() return fromAddr(nil, addr) end
        }
    )
end
function HGroup.prototype.at(self, preset)
    self._cmd((self.addr .. " At ") .. preset.addr)
end
____exports.HGroup = HGroup
return ____exports
 end,
["lib.ma_obj.HMacroLine"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local getChildByIndex = ____MAUtils.getChildByIndex
local getChildByNameOrIndex = ____MAUtils.getChildByNameOrIndex
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local HMacroLineMAPropTypes = {command = "string", name = "string", enabled = "boolean"}
____exports.HMacroLine = __TS__Class()
local HMacroLine = ____exports.HMacroLine
HMacroLine.name = "HMacroLine"
__TS__ClassExtends(HMacroLine, HObject)
function HMacroLine.prototype.____constructor(self, macroId, lineNumber, context)
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "Macro", macroId, lineNumber),
        lineNumber,
        {
            context = context,
            _getObj = function()
                local macroObj = getChildByNameOrIndex(
                    nil,
                    DataPool().Macros,
                    macroId
                )
                if macroObj == nil then
                    return nil
                end
                return getChildByIndex(nil, macroObj, lineNumber)
            end,
            _getParent = function()
                return getChildByNameOrIndex(
                    nil,
                    DataPool().Macros,
                    macroId
                )
            end
        }
    )
    self.macroId = macroId
    self.lineNumber = lineNumber
end
function HMacroLine.prototype.getMAPropTypes(self)
    return HMacroLineMAPropTypes
end
return ____exports
 end,
["lib.ma_obj.HMacro"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local fromAddr = ____MAUtils.fromAddr
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____common = require("lib.ma_obj.common")
local setAppearance = ____common.setAppearance
local ____HMacroLine = require("lib.ma_obj.HMacroLine")
local HMacroLine = ____HMacroLine.HMacroLine
local HMacro = __TS__Class()
HMacro.name = "HMacro"
__TS__ClassExtends(HMacro, HObject)
function HMacro.prototype.____constructor(self, id, context)
    local addr = buildAddress(nil, "Macro", id)
    HObject.prototype.____constructor(
        self,
        addr,
        id,
        {
            context = context,
            _getObj = function() return fromAddr(nil, addr) end,
            _getParent = function() return DataPool().Macros end
        }
    )
end
function HMacro.prototype.setLines(self, macroLines)
    self:deleteAllChildren()
    for ____, line in ipairs(macroLines) do
        local macroLine = self:addLine()
        macroLine:setProps(line)
    end
    return self
end
function HMacro.prototype.addLine(self)
    local thisObj = self:getObj()
    if self:isExecModeCmdLine() then
        local lineCount = thisObj:Count()
        if self.context == nil then
            return __TS__New(HMacroLine, self.indexOrName, lineCount + 1, self.context):store()
        else
            return self.context.of:HMacroLine(self.indexOrName, lineCount + 1):store()
        end
    else
        local child = thisObj:Append("MacroLine")
        return __TS__New(HMacroLine, self.indexOrName, child.index, self.context)
    end
end
function HMacro.prototype.deleteAllLines(self)
    if self:exists() then
        self._cmd(("Delete " .. self.addr) .. ".1 Thru /nc")
    end
    return self
end
function HMacro.prototype.appearance(self, appearance)
    setAppearance(nil, self, appearance)
    return self
end
____exports.HMacro = HMacro
return ____exports
 end,
["lib.ma_obj.HLayoutElement"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____common = require("lib.ma_obj.common")
local ObjCache = ____common.ObjCache
local setAppearance = ____common.setAppearance
local HLayoutElementMAPropTypes = {
    borderSize = "number",
    borderColor = "color",
    customtext = "string",
    fontsize = "string",
    name = "string",
    paddingTop = "number",
    paddingBottom = "number",
    paddingRight = "number",
    paddingLeft = "number",
    posx = "number",
    posy = "number",
    positionW = "number",
    positionH = "number",
    textColor = "color",
    textAlignmentH = "string",
    textAlignmentV = "string",
    visibilityBorder = "isVisible",
    visibilityObjectName = "isVisible",
    visibilityIndicatorBar = "isVisible",
    visibilityElement = "isVisible"
}
____exports.HLayoutElement = __TS__Class()
local HLayoutElement = ____exports.HLayoutElement
HLayoutElement.name = "HLayoutElement"
__TS__ClassExtends(HLayoutElement, HObject)
function HLayoutElement.prototype.____constructor(self, parent, elementNumberOrName, context)
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "Layout", parent.indexOrName, elementNumberOrName),
        elementNumberOrName,
        {
            context = context,
            _objCache = ObjCache(
                nil,
                parent:getObj(),
                elementNumberOrName
            )
        }
    )
    self.parent = parent
    self.elementNumberOrName = elementNumberOrName
    self.elementNumberOrName = elementNumberOrName
end
function HLayoutElement.prototype._setProp(self, propName, value)
    self._cmd(((((("Set " .. self.addr) .. " ") .. propName) .. " '") .. tostring(value)) .. "'")
    return self
end
function HLayoutElement.prototype.getMAPropTypes(self)
    return HLayoutElementMAPropTypes
end
function HLayoutElement.prototype.getId(self)
    return self:getObj():Get("ID")
end
function HLayoutElement.prototype.getAsssignType(self)
    return self:getObj():Get("AssignType")
end
function HLayoutElement.prototype.setAssignedMacro(self, macro)
    macro:assignTo(self)
    return self
end
function HLayoutElement.prototype.posX(self, value)
    return self:_setProp("posx", value)
end
function HLayoutElement.prototype.posY(self, value)
    return self:_setProp("posy", value)
end
function HLayoutElement.prototype.width(self, value)
    return self:_setProp("positionW", value)
end
function HLayoutElement.prototype.height(self, value)
    return self:_setProp("positionH", value)
end
function HLayoutElement.prototype.customLabel(self, label)
    return self:_setProp("customtext", label)
end
function HLayoutElement.prototype.fontSize(self, size)
    return self:_setProp("fontsize", size)
end
function HLayoutElement.prototype.setName(self, name)
    return self:_setProp("name", name)
end
function HLayoutElement.prototype.visibilityObjectName(self, enabled)
    return self:_setProp("visibilityobjectname", enabled and "Visible" or "Hidden")
end
function HLayoutElement.prototype.visibilityIndicatorBar(self, enabled)
    return self:_setProp("visibilityIndicatorBar", enabled and "Visible" or "Hidden")
end
function HLayoutElement.prototype.visibilityBorder(self, enabled)
    return self:_setProp("visibilityBorder", enabled and "Visible" or "Hidden")
end
function HLayoutElement.prototype.appearance(self, appearance)
    if appearance == nil then
        return self
    else
        setAppearance(nil, self, appearance)
    end
    return self
end
function HLayoutElement.prototype.toLuaPropValue(self, propName, propValue)
    repeat
        local ____switch22 = propName
        local ____cond22 = ____switch22 == "visibilityBorder" or ____switch22 == "visibilityObjectName" or ____switch22 == "visibilityIndicatorBar" or ____switch22 == "visibilityElement"
        if ____cond22 then
            do
                return propValue == "Visible"
            end
        end
        ____cond22 = ____cond22 or ____switch22 == "fontSize"
        if ____cond22 then
            do
                return tostring(propValue)
            end
        end
        do
            do
                return propValue
            end
        end
    until true
end
return ____exports
 end,
["lib.ma_obj.HLayout"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local ____HLayoutElement = require("lib.ma_obj.HLayoutElement")
local HLayoutElement = ____HLayoutElement.HLayoutElement
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____common = require("lib.ma_obj.common")
local ObjCache = ____common.ObjCache
local HLayout = __TS__Class()
HLayout.name = "HLayout"
__TS__ClassExtends(HLayout, HObject)
function HLayout.prototype.____constructor(self, id, context)
    local addr = buildAddress(nil, "Layout", id)
    HObject.prototype.____constructor(
        self,
        addr,
        id,
        {
            context = context,
            _objCache = ObjCache(
                nil,
                DataPool().Layouts,
                id
            )
        }
    )
end
function HLayout.prototype.delete(self)
    return HObject.prototype.delete(self)
end
function HLayout.prototype.getNumOfElements(self)
    return self:getObj():Count()
end
function HLayout.prototype.getAllElements(self)
    return __TS__ArrayMap(
        __TS__ArraySort(
            self:getObj():Children(),
            function(____, a, b)
                return a.index - b.index
            end
        ),
        function(____, c) return __TS__New(HLayoutElement, self, c.index, self.context) end
    )
end
function HLayout.prototype.getElementByName(self, name)
    local elm = self:getObj()[name]
    local ____temp_0
    if elm == nil then
        ____temp_0 = nil
    else
        ____temp_0 = __TS__New(HLayoutElement, self, elm.index, self.context)
    end
    return ____temp_0
end
function HLayout.prototype.getElementByNumber(self, elementNumber)
    return __TS__New(HLayoutElement, self, elementNumber, self.context)
end
function HLayout.prototype.addElement(self, hObj)
    local srcAddr = hObj.addr
    local thisObj = self:getObj()
    if self:isExecModeCmdLine() then
        self._cmd((("Assign " .. srcAddr) .. " At ") .. self.addr)
    else
        local elm = thisObj:Append(thisObj:GetChildClass())
        elm.object = hObj:getObj()
    end
    local elementNumber = thisObj:Count()
    return __TS__New(HLayoutElement, self, elementNumber, self.context)
end
function HLayout.prototype.addLabelElement(self)
    local nextElementNumber = self:getObj():Count() + 1
    if self:isExecModeCmdLine() then
        self._cmd((("Store " .. self.addr) .. ".") .. tostring(nextElementNumber))
    else
        local thisObj = self:getObj()
        thisObj:Append(thisObj:GetChildClass())
    end
    return __TS__New(HLayoutElement, self, nextElementNumber, self.context)
end
function HLayout.prototype.deleteAllElements(self)
    if self:getNumOfElements() > 0 then
        if self:isExecModeCmdLine() then
            self._cmd(("Delete " .. self.addr) .. ".1 Thru")
        else
            self:deleteAllChildren()
        end
    end
end
____exports.HLayout = HLayout
return ____exports
 end,
["lib.ma_obj.HMasterGrand"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
____exports.HMasterGrand = __TS__Class()
local HMasterGrand = ____exports.HMasterGrand
HMasterGrand.name = "HMasterGrand"
__TS__ClassExtends(HMasterGrand, HObject)
function HMasterGrand.prototype.____constructor(self, ____type, context)
    HObject.prototype.____constructor(
        self,
        "Master 2." .. ____type,
        ____type,
        {
            context = context,
            _getObj = function()
                return Root().ShowData.Masters.Grand[____type]
            end
        }
    )
end
return ____exports
 end,
["lib.ma_obj.HMidiRemote"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local getChildByNameOrIndex = ____MAUtils.getChildByNameOrIndex
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local HMidiRemote = __TS__Class()
HMidiRemote.name = "HMidiRemote"
__TS__ClassExtends(HMidiRemote, HObject)
function HMidiRemote.prototype.____constructor(self, id, context)
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "Remote", 2, id),
        id,
        {
            context = context,
            _getObj = function()
                return getChildByNameOrIndex(
                    nil,
                    Root().ShowData.Remotes.MIDIRemotes,
                    id
                )
            end
        }
    )
    self.id = id
end
function HMidiRemote.prototype.setTarget(self, target)
    target:assignTo(self)
    return self
end
____exports.HMidiRemote = HMidiRemote
return ____exports
 end,
["lib.ma_obj.HMidiRemotes"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HBasicObject = require("lib.ma_obj.HBasicObject")
local HBasicObject = ____HBasicObject.HBasicObject
local HMidiRemotes = __TS__Class()
HMidiRemotes.name = "HMidiRemotes"
__TS__ClassExtends(HMidiRemotes, HBasicObject)
function HMidiRemotes.prototype.____constructor(self, context)
    HBasicObject.prototype.____constructor(
        self,
        {
            context = context,
            _getObj = function() return Root().ShowData.Remotes.MIDIRemotes end
        }
    )
end
function HMidiRemotes.prototype.addRemote(self)
    local nextRemoteId = self:getObj():Count() + 1
    return self.context.of:HMidiRemote(nextRemoteId):store()
end
function HMidiRemotes.prototype.getRemotes(self)
    return __TS__ArrayMap(
        self:getObj():Children(),
        function(____, child) return self.context.of:HMidiRemote(child.index) end
    )
end
____exports.HMidiRemotes = HMidiRemotes
return ____exports
 end,
["lib.ma_obj.HPage"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local fromAddr = ____MAUtils.fromAddr
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local HPage = __TS__Class()
HPage.name = "HPage"
__TS__ClassExtends(HPage, HObject)
function HPage.prototype.____constructor(self, pageNumber, context)
    local addr = buildAddress(nil, "Page", pageNumber)
    HObject.prototype.____constructor(
        self,
        addr,
        pageNumber,
        {
            context = context,
            _getObj = function() return fromAddr(nil, addr) end
        }
    )
end
function HPage.prototype.getExecutor(self, index)
    return self.context.of:HExecutor({page = self.index, index = index})
end
____exports.HPage = HPage
return ____exports
 end,
["lib.ma_obj.HPlugin"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local getChildByNameOrIndex = ____MAUtils.getChildByNameOrIndex
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local HPluginMAPropTypes = {version = "string"}
____exports.HPlugin = __TS__Class()
local HPlugin = ____exports.HPlugin
HPlugin.name = "HPlugin"
__TS__ClassExtends(HPlugin, HObject)
function HPlugin.prototype.____constructor(self, idOrName, context)
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "Plugin", idOrName),
        idOrName,
        {
            context = context,
            _getObj = function()
                return getChildByNameOrIndex(
                    nil,
                    DataPool().Plugins,
                    idOrName
                )
            end
        }
    )
end
function HPlugin.prototype.getMAPropTypes(self)
    return HPluginMAPropTypes
end
return ____exports
 end,
["lib.RangeUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local function lastIndex(self, r)
    return r.start + r.size - 1
end
local function intersects(self, a, b)
    if a.start == b.start then
        return true
    elseif a.start < b.start then
        return lastIndex(nil, a) >= b.start
    else
        return lastIndex(nil, b) >= a.start
    end
end
--- Split range.
-- 
-- @param index a 1-based absolut index that will start the second range
-- @return array of 2 ranges
local function split(self, range, index)
    if index > range.size then
        error(((("RangeUtils.split():split index (" .. tostring(index)) .. ") exceeds range size (") .. tostring(range.size)) .. ")")
    end
    local firstPartSize = index - range.start
    return {{start = range.start, size = firstPartSize}, {start = index, size = range.size - firstPartSize}}
end
--- Get the leftover range if you trimmed the given range to be of the given trim-size.
local function getLeftover(self, range, keepSize)
    if keepSize > range.size then
        error(((("RangeUtils.getLeftover(): trimSize (" .. tostring(keepSize)) .. ") exceeds range size (") .. tostring(range.size)) .. ")")
    end
    return {start = range.start + keepSize, size = range.size - keepSize}
end
local function describe(self, r)
    return (tostring(r.start) .. "-") .. tostring(r.start + r.size - 1)
end
local function isInRange(self, index, range)
    return index >= range.start and index < range.start + range.size
end
____exports.RangeUtils = {
    intersects = intersects,
    isInRange = isInRange,
    describe = describe,
    lastIndex = lastIndex,
    split = split,
    getLeftover = getLeftover
}
return ____exports
 end,
["lib.PoolUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local doAreAllPoolsAvailable, isPoolRangeAvailable
local ____MAPoolsInfo = require("lib.MAPoolsInfo")
local MAPoolsInfo = ____MAPoolsInfo.MAPoolsInfo
local ____MAUtils = require("lib.MAUtils")
local getChildByIndex = ____MAUtils.getChildByIndex
local ____Utils = require("lib.Utils")
local objectValues = ____Utils.objectValues
local ____RangeUtils = require("lib.RangeUtils")
local RangeUtils = ____RangeUtils.RangeUtils
function doAreAllPoolsAvailable(self, pools, range)
    for ____, pool in ipairs(objectValues(nil, pools)) do
        if not isPoolRangeAvailable(nil, pool, range) then
            return false
        end
    end
    return true
end
function isPoolRangeAvailable(self, pool, range)
    local result = true
    local i
    do
        i = pool.curChildIndex
        while i < #pool.sortedUsedIndice do
            local curObjId = pool.sortedUsedIndice[i + 1]
            if curObjId >= range.start then
                if curObjId < range.start + range.size then
                    result = false
                    pool.curChildIndex = i
                    return false
                else
                    pool.curChildIndex = i
                    return true
                end
            end
            i = i + 1
        end
    end
    pool.curChildIndex = i
    return true
end
____exports.MAX_POOL_INDEX = 9999
local DEFAULT_SECTOR_SIZE = 100
local function findNextEmptyPoolIndex(self, pool, startIndex)
    local poolEntry = __TS__ArraySort(
        pool:Children(),
        function(____, a, b) return a.index - b.index end
    )
    local curIndex = startIndex
    for ____, entry in ipairs(poolEntry) do
        if entry.index > curIndex then
            return curIndex
        elseif entry.index == curIndex then
            curIndex = curIndex + 1
        end
    end
    return curIndex
end
local function isRangeEmpty(self, pool, range)
    local usedIndice = __TS__ArraySort(__TS__ArrayMap(
        pool:Children(),
        function(____, o) return o.index end
    ))
    for ____, usedIndex in ipairs(usedIndice) do
        if usedIndex >= range.start then
            return usedIndex > RangeUtils:lastIndex(range)
        end
    end
    return true
end
local function getSortedUsedIndice(self, poolId)
    local poolInfo = MAPoolsInfo(nil):byId(poolId)
    return __TS__ArraySort(__TS__ArrayMap(
        poolInfo:getPoolObject():Children(),
        function(____, o) return o.index end
    ))
end
local function findEmptyRange(self, poolId, startingFrom, size)
    local poolInfo = MAPoolsInfo(nil):byId(poolId)
    local usedIndice = getSortedUsedIndice(nil, poolId)
    local start = startingFrom
    for ____, usedIndex in ipairs(usedIndice) do
        if usedIndex >= startingFrom then
            local lastIndex = start + size - 1
            if lastIndex > poolInfo.maxObjects then
                return nil
            else
                if usedIndex > lastIndex then
                    return {start = start, size = size}
                else
                    start = usedIndex + 1
                end
            end
        end
    end
    return {start = start, size = size}
end
local function createPoolUsages(self, poolIds)
    local poolsInfo = MAPoolsInfo(nil)
    local pools = __TS__ArrayReduce(
        poolIds,
        function(____, prev, poolId)
            local poolInfo = poolsInfo:byId(poolId)
            local poolObj = poolInfo:getPoolObject(poolInfo:getDefaultParent())
            prev[poolId] = {
                poolId = poolId,
                curChildIndex = 1,
                sortedUsedIndice = __TS__ArrayMap(
                    __TS__ArraySort(
                        poolObj:Children(),
                        function(____, a, b) return a.index - b.index end
                    ),
                    function(____, o) return o.index end
                )
            }
            return prev
        end,
        {}
    )
    return pools
end
local function getSortedChildrenIndice(self, poolId)
    local poolInfo = MAPoolsInfo(nil):byId(poolId)
    local poolObj = poolInfo:getPoolObject(poolInfo:getDefaultParent())
    return __TS__ArrayMap(
        __TS__ArraySort(
            poolObj:Children(),
            function(____, a, b) return a.index - b.index end
        ),
        function(____, o) return o.index end
    )
end
local function findAvailableMultiPoolRange(self, poolIds, rangeSize, fromIndex)
    local pools = createPoolUsages(nil, poolIds)
    local step = 100
    local curRangeStart = fromIndex
    while curRangeStart < 10000 - step do
        local curRange = {start = curRangeStart, size = rangeSize}
        if doAreAllPoolsAvailable(nil, pools, curRange) then
            return curRange
        end
        curRangeStart = curRangeStart + step
    end
    return nil
end
local function areAllPoolsAvailable(self, poolIds, range)
    local pools = createPoolUsages(nil, poolIds)
    return doAreAllPoolsAvailable(nil, pools, range)
end
--- Get the index of the last object in the given range
-- 
-- @returns undefined if the range doesn't include any objects
local function getLastObjectInRange(self, poolId, range)
    local usedIndiceInRange = __TS__ArrayFilter(
        getSortedUsedIndice(nil, poolId),
        function(____, o) return RangeUtils:isInRange(o, range) end
    )
    return usedIndiceInRange[#usedIndiceInRange]
end
local function childExists(self, poolObj, index)
    return getChildByIndex(nil, poolObj, index) ~= nil
end
____exports.PoolUtils = {
    getSortedChildrenIndice = getSortedChildrenIndice,
    areAllPoolsAvailable = areAllPoolsAvailable,
    childExists = childExists,
    findAvailableMultiPoolRange = findAvailableMultiPoolRange,
    findNextEmptyPoolIndex = findNextEmptyPoolIndex,
    findEmptyRange = findEmptyRange,
    getSortedUsedIndice = getSortedUsedIndice,
    getLastObjectInRange = getLastObjectInRange,
    isRangeEmpty = isRangeEmpty
}
return ____exports
 end,
["lib.ma_obj.HPool"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAPoolsInfo = require("lib.MAPoolsInfo")
local MAPoolsInfo = ____MAPoolsInfo.MAPoolsInfo
local ____PoolUtils = require("lib.PoolUtils")
local PoolUtils = ____PoolUtils.PoolUtils
local ____RangeUtils = require("lib.RangeUtils")
local RangeUtils = ____RangeUtils.RangeUtils
local ____HBasicObject = require("lib.ma_obj.HBasicObject")
local HBasicObject = ____HBasicObject.HBasicObject
____exports.HPool = __TS__Class()
local HPool = ____exports.HPool
HPool.name = "HPool"
__TS__ClassExtends(HPool, HBasicObject)
function HPool.prototype.____constructor(self, poolId, context)
    self.poolId = poolId
    self.context = context
    local poolInfo = MAPoolsInfo(nil):byId(poolId)
    HBasicObject.prototype.____constructor(
        self,
        {
            context = context,
            _getObj = function() return poolInfo:getPoolObject() end
        }
    )
end
function HPool.prototype.deleteRange(self, range, options)
    local poolInfo = MAPoolsInfo(nil):byId(self.poolId)
    local ____self__cmdIndirect_4 = self._cmdIndirect
    local ____temp_2 = poolInfo:getAddress(range.start)
    local ____temp_3 = RangeUtils:lastIndex(range)
    local ____options_noConfirm_0 = options
    if ____options_noConfirm_0 ~= nil then
        ____options_noConfirm_0 = ____options_noConfirm_0.noConfirm
    end
    ____self__cmdIndirect_4((((("Delete " .. ____temp_2) .. " Thru ") .. tostring(____temp_3)) .. " ") .. (____options_noConfirm_0 == true and "/nc" or ""))
end
function HPool.prototype.moveObject(self, source, destination)
    local poolInfo = MAPoolsInfo(nil):byId(self.poolId)
    self._cmd((("Move " .. poolInfo:getAddress(source)) .. " At ") .. poolInfo:getAddress(destination))
end
function HPool.prototype.moveRange(self, sourceStart, sourceEnd, destination)
    local poolInfo = MAPoolsInfo(nil):byId(self.poolId)
    self._cmd((((("Move " .. poolInfo:getAddress(sourceStart)) .. " Thru ") .. tostring(sourceEnd)) .. " At ") .. poolInfo:getAddress(destination))
end
function HPool.prototype.isRangeEmpty(self, range)
    return PoolUtils:isRangeEmpty(
        self:getObj(),
        range
    )
end
function HPool.prototype.isRangeContainsLockedObjects(self, range)
    local sortedObjects = __TS__ArraySort(
        self:getObj():Children(),
        function(____, a, b) return a.index - b.index end
    )
    for ____, obj in ipairs(sortedObjects) do
        if obj.index >= range.start then
            if obj.index > RangeUtils:lastIndex(range) then
                return false
            elseif obj:Get("lock") == "Yes" then
                return true
            end
        end
    end
    return false
end
return ____exports
 end,
["lib.ma_obj.Utils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.RGBAToHex(self, color)
    return ((string.format(
        "%x",
        math.floor(color.r * 2.55)
    ) .. string.format(
        "%x",
        math.floor(color.g * 2.55)
    )) .. string.format(
        "%x",
        math.floor(color.b * 2.55)
    )) .. string.format(
        "%x",
        math.floor(color.a * 2.55)
    )
end
function ____exports.getCurrentScreenConfiguration(self)
    return CurrentUser().SCREENCONFIG
end
return ____exports
 end,
["lib.ma_obj.HWindow"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local intersects
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local ____common = require("lib.ma_obj.common")
local setAppearance = ____common.setAppearance
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____Utils = require("lib.ma_obj.Utils")
local getCurrentScreenConfiguration = ____Utils.getCurrentScreenConfiguration
function ____exports.toHalfCellUnits(self, layout)
    return {
        unit = "half-cell",
        x = math.floor(layout.x * 2),
        y = math.floor(layout.y * 2),
        w = math.floor(layout.w * 2),
        h = math.floor(layout.h * 2)
    }
end
function ____exports.doLayoutsIntersect(self, a, b)
    local xIntersects = intersects(nil, {start = a.x, ["end"] = a.x + a.w - 1}, {start = b.x, ["end"] = b.x + b.w - 1})
    local yIntersects = intersects(nil, {start = a.y, ["end"] = a.y + a.h - 1}, {start = b.y, ["end"] = b.y + b.h - 1})
    return xIntersects and yIntersects
end
function intersects(self, a, b)
    if a.start == b.start then
        return true
    elseif a.start < b.start then
        return b.start <= a["end"]
    else
        return a.start <= b["end"]
    end
end
local HWindowMAPropTypes = {
    poolColor = "string",
    X = "number",
    Y = "number",
    W = "number",
    H = "number",
    minH = "number",
    minW = "number"
}
local HWindow = __TS__Class()
HWindow.name = "HWindow"
__TS__ClassExtends(HWindow, HObject)
function HWindow.prototype.____constructor(self, screenNumber, windowNumber, context)
    self.screenNumber = screenNumber
    self.windowNumber = windowNumber
    assert(screenNumber > 0, "Invalid screenNumber")
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "ScreenContent", screenNumber, windowNumber),
        windowNumber,
        {
            context = context,
            _getObj = function()
                local sc = getCurrentScreenConfiguration(nil).ScreenContents["ScreenContent " .. tostring(screenNumber)]
                return sc:Children()[windowNumber]
            end
        }
    )
end
__TS__SetDescriptor(
    HWindow.prototype,
    "windowScrollPositions",
    {get = function(self)
        return self:getObj().WindowScrollPositions
    end},
    true
)
function HWindow.prototype.getMAPropTypes(self)
    return HWindowMAPropTypes
end
function HWindow.prototype.getType(self)
    return self.name
end
function HWindow.prototype.setWindowScrollV(self, scrollIndex)
    if self:isExecModeCmdLine() then
        local command = ((((("Set " .. self.addr) .. " \"ScrollV\" \"") .. tostring(scrollIndex)) .. ",") .. tostring(scrollIndex)) .. "\""
        self._cmd(command)
    else
        self.windowScrollPositions.scrollV = (tostring(scrollIndex) .. ",") .. tostring(scrollIndex)
    end
    return self
end
function HWindow.prototype.setWindowLayoutCellUnits(self, layout)
    self:setWindowLayout(____exports.toHalfCellUnits(nil, layout))
end
function HWindow.prototype.isNewLayoutValid(self, layout)
    for ____, window in ipairs(self.context.of:HScreenContent(self.screenNumber):getAllWindows()) do
        if window:getObj() ~= self:getObj() then
            if ____exports.doLayoutsIntersect(
                nil,
                window:getWindowLayout(),
                layout
            ) then
                return false
            end
        end
    end
    return true
end
function HWindow.prototype.setWindowLayout(self, layout)
    if not self:isNewLayoutValid(layout) then
        error(self.log:msg("setWindowLayout(): invalid layout collids with other windows"))
    end
    self:setProps({
        X = math.floor(layout.x + 0.5),
        Y = math.floor(layout.y + 0.5),
        W = math.floor(layout.w + 0.5),
        H = math.floor(layout.h + 0.5)
    })
    if self:getWindowLayout().w ~= math.floor(layout.w + 0.5) then
        error("Could not set window width")
    end
    return self
end
function HWindow.prototype.getWindowLayout(self)
    local obj = self:getObj()
    return {
        unit = "half-cell",
        x = obj.x,
        y = obj.y,
        w = obj.w,
        h = obj.h
    }
end
function HWindow.prototype.getWindowLayoutCellUnits(self)
    local obj = self:getObj()
    return {
        unit = "cell",
        x = obj.x / 2,
        y = obj.y / 2,
        w = obj.w / 2,
        h = obj.h / 2
    }
end
function HWindow.prototype.isPoolWindow(self)
    return __TS__StringEndsWith(
        self:getType(),
        "Pool"
    )
end
function HWindow.prototype.appearance(self, appearance)
    setAppearance(nil, self, appearance)
    return self
end
____exports.HWindow = HWindow
function ____exports.windowLayoutsEqual(self, a, b)
    return a.x == b.x or a.y == b.y or a.w == b.w or a.h == b.h
end
function ____exports.parseWindowId(self, id)
    local numberParts = __TS__ArrayMap(
        __TS__StringSplit(id, "."),
        function(____, s) return __TS__ParseInt(s) end
    )
    return {screenNumber = numberParts[1], index = numberParts[2]}
end
return ____exports
 end,
["lib.ma_obj.Window.HWindowLayoutView"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HWindow = require("lib.ma_obj.HWindow")
local HWindow = ____HWindow.HWindow
local HWindowLayoutView = __TS__Class()
HWindowLayoutView.name = "HWindowLayoutView"
__TS__ClassExtends(HWindowLayoutView, HWindow)
function HWindowLayoutView.prototype.____constructor(self, screenNumber, windowNumber, context)
    HWindow.prototype.____constructor(self, screenNumber, windowNumber, context)
    self.screenNumber = screenNumber
    self.windowNumber = windowNumber
    assert(self.name == "WindowLayoutView", "Window is not a WindowLayoutView. " .. self.addr)
end
__TS__SetDescriptor(
    HWindowLayoutView.prototype,
    "settings",
    {get = function(self)
        return self:getObj().LayoutViewSettings
    end},
    true
)
function HWindowLayoutView.prototype.getLayoutIndex(self)
    return self:getObj().LayoutViewSettings:Get("Layout").index
end
function HWindowLayoutView.prototype.updateSettings(self, _settings)
    local ____settings_0 = _settings
    local layout = ____settings_0.layout
    local autoFit = ____settings_0.autoFit
    local canvasFitMode = ____settings_0.canvasFitMode
    local fitType = ____settings_0.fitType
    local showTitleBar = ____settings_0.showTitleBar
    local lockPosition = ____settings_0.lockPosition
    local paddingLeft = ____settings_0.paddingLeft
    local paddingRight = ____settings_0.paddingRight
    local paddingTop = ____settings_0.paddingTop
    local paddingBottom = ____settings_0.paddingBottom
    local layoutViewSettings = self.settings
    if layout ~= nil then
        layoutViewSettings:Set(
            "Layout",
            layout:getObj()
        )
    end
    if autoFit ~= nil then
        layoutViewSettings:Set("AutoFit", autoFit)
    end
    if canvasFitMode ~= nil then
        layoutViewSettings:Set("CanvasFitMode", canvasFitMode)
    end
    if fitType ~= nil then
        layoutViewSettings:Set("FitType", fitType)
    end
    if showTitleBar ~= nil and self:isSupported("ShowTitleBar") then
        layoutViewSettings:Set("ShowTitleBar", showTitleBar)
    end
    if lockPosition ~= nil then
        layoutViewSettings:Set("Lock", lockPosition)
    end
    if paddingLeft ~= nil then
        self.settings:Set("PaddingLeft", paddingBottom)
    end
    if paddingRight ~= nil then
        self.settings:Set("PaddingRight", paddingBottom)
    end
    if paddingTop ~= nil then
        self.settings:Set("PaddingTop", paddingBottom)
    end
    if paddingBottom ~= nil then
        self.settings:Set("PaddingBottom", paddingBottom)
    end
    return self
end
function HWindowLayoutView.prototype.isSupported(self, propName)
    return self.settings:Get("ShowTitleBar") ~= nil
end
____exports.HWindowLayoutView = HWindowLayoutView
return ____exports
 end,
["lib.ma_obj.HScreenContent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____HWindow = require("lib.ma_obj.HWindow")
local HWindow = ____HWindow.HWindow
local toHalfCellUnits = ____HWindow.toHalfCellUnits
local ____Utils = require("lib.ma_obj.Utils")
local getCurrentScreenConfiguration = ____Utils.getCurrentScreenConfiguration
local ____HWindowLayoutView = require("lib.ma_obj.Window.HWindowLayoutView")
local HWindowLayoutView = ____HWindowLayoutView.HWindowLayoutView
local DIRECT_MODE_ADD_WINDOW_ENABLED = false
local HScreenContent = __TS__Class()
HScreenContent.name = "HScreenContent"
__TS__ClassExtends(HScreenContent, HObject)
function HScreenContent.prototype.____constructor(self, screenNumber, context)
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "ScreenContent", screenNumber),
        screenNumber,
        {
            context = context,
            _getObj = function()
                return getCurrentScreenConfiguration(nil).ScreenContents["ScreenContent " .. tostring(screenNumber)]
            end
        }
    )
    self.screenNumber = screenNumber
end
function HScreenContent.getAllScreenContents(self, of)
    local screenContents = getCurrentScreenConfiguration(nil).ScreenContents
    return __TS__ArrayMap(
        screenContents:Children(),
        function(____, sc) return of:HScreenContent(sc.index) end
    )
end
function HScreenContent.prototype.addWindowLayoutViewIfPossible(self, options)
    local newWindow = self:addWindowIfPossible(__TS__ObjectAssign({windowType = "WindowLayoutView"}, options))
    local ____temp_0
    if newWindow == nil then
        ____temp_0 = nil
    else
        ____temp_0 = __TS__New(HWindowLayoutView, self.screenNumber, newWindow.windowNumber, self.context)
    end
    return ____temp_0
end
function HScreenContent.prototype.addWindowLayoutView(self, options)
    local newWindow = self:addWindow(__TS__ObjectAssign({windowType = "WindowLayoutView"}, options))
    return __TS__New(HWindowLayoutView, self.screenNumber, newWindow.windowNumber, self.context)
end
function HScreenContent.prototype.addWindowIfPossible(self, options)
    return self:doAddWindow(options, true)
end
function HScreenContent.prototype.addWindow(self, options)
    return self:doAddWindow(options, false)
end
function HScreenContent.prototype.doAddWindow(self, options, isFailable)
    local l = toHalfCellUnits(nil, options.layout)
    local numOfWindows = self:getObj():Count()
    local nextWindowNumber = numOfWindows + 1
    local presetPoolTypeProp = options.presetPoolType == nil and "" or "presetpooltype=" .. tostring(options.presetPoolType - 1)
    if self:isExecModeCmdLine() or not DIRECT_MODE_ADD_WINDOW_ENABLED then
        local err = self._cmdFailable((((((((((((((((("Store " .. self.addr) .. " \"") .. options.windowType) .. "\" minW=") .. 2) .. " minH=") .. 2) .. " x=") .. tostring(l.x)) .. " y=") .. tostring(l.y)) .. " w=") .. tostring(l.w)) .. " h=") .. tostring(l.h)) .. " ") .. presetPoolTypeProp)
        if err ~= nil then
            if isFailable then
                return nil
            else
                error("Error storing window: " .. err)
            end
        end
    else
        local w = self:getObj():Append("ViewWidget")
        w.name = options.windowType
        w.nameAndApp = options.windowType
        w.display = self.screenNumber
        w.minW = 2
        w.minH = 2
        w.x = l.x
        w.y = l.y
        w.w = l.w
        w.h = l.h
        if options.presetPoolType ~= nil then
            w.presetPoolType = options.presetPoolType - 1
        end
        if options.windowType == "WindowLayoutView" then
            w:Create(1, "LayoutViewSettings")
            w:Create(2, "WindowAppearance")
            w:Create(3, "WindowScrollPositions")
        end
    end
    return __TS__New(HWindow, self.screenNumber, nextWindowNumber, self.context)
end
function HScreenContent.prototype.getWindow(self, windowNumber)
    return __TS__New(HWindow, self.screenNumber, windowNumber, self.context)
end
function HScreenContent.prototype.getLayoutViewWindow(self, windowNumber)
    return __TS__New(HWindowLayoutView, self.screenNumber, windowNumber, self.context)
end
function HScreenContent.prototype.isEmpty(self)
    return self:getObj():Count() == 0
end
function HScreenContent.prototype.getAllWindows(self)
    return __TS__ArrayMap(
        self:getObj():Children(),
        function(____, window) return __TS__New(HWindow, self.screenNumber, window.index, self.context) end
    )
end
function HScreenContent.prototype.deleteWindowsFrom(self, fromWindowNumber)
    if __TS__New(HWindow, self.screenNumber, fromWindowNumber, self.context):exists() then
        self._cmd(((("Delete " .. self.addr) .. ".") .. tostring(fromWindowNumber)) .. " thru")
    end
end
function HScreenContent.prototype.deleteAllWindows(self)
    if self:exists() then
        self._cmd(("Delete " .. self.addr) .. ".* /nc")
    else
        error(("deleteContent(): " .. self.addr) .. " doesn not exist")
    end
    return self
end
____exports.HScreenContent = HScreenContent
return ____exports
 end,
["lib.ma_obj.HView"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local fromAddr = ____MAUtils.fromAddr
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local HView = __TS__Class()
HView.name = "HView"
__TS__ClassExtends(HView, HObject)
function HView.prototype.____constructor(self, id, context)
    local addr = buildAddress(nil, "View", id)
    HObject.prototype.____constructor(
        self,
        addr,
        id,
        {
            context = context,
            _getObj = function() return fromAddr(nil, addr) end
        }
    )
end
function HView.prototype.recall(self)
    self._cmd(self.addr)
    return self
end
function HView.prototype.store(self, options)
    local ____options_0 = options
    local label = ____options_0.label
    local screenNumbers = ____options_0.screenNumbers
    local labelPart = label and ("\"" .. label) .. "\"" or ""
    local screens = screenNumbers == nil and "" or ("/Screen \"" .. table.concat(screenNumbers, ",")) .. "\""
    self._cmd(((((("Store " .. self.addr) .. " ") .. labelPart) .. " ") .. screens) .. " /nc")
    if self:isExecModeDirectLua() then
        self.log:debug("HView.store() : DirectLua not implemented. Using CommandLine")
    end
    return self
end
function HView.prototype.getAppearance(self)
    local appearance = self:getObj():Get("Appearance")
    if appearance ~= nil then
        return self.context.of:HAppearance(appearance.index)
    end
    return nil
end
____exports.HView = HView
return ____exports
 end,
["lib.ma_obj.HViewButton"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAUtils = require("lib.MAUtils")
local buildAddress = ____MAUtils.buildAddress
local getChildByIndex = ____MAUtils.getChildByIndex
local ____HObject = require("lib.ma_obj.HObject")
local HObject = ____HObject.HObject
local ____Utils = require("lib.ma_obj.Utils")
local getCurrentScreenConfiguration = ____Utils.getCurrentScreenConfiguration
local HViewButton = __TS__Class()
HViewButton.name = "HViewButton"
__TS__ClassExtends(HViewButton, HObject)
function HViewButton.prototype.____constructor(self, screenNumber, id, context)
    HObject.prototype.____constructor(
        self,
        buildAddress(nil, "ViewButton", screenNumber, id),
        id,
        {
            context = context,
            _getObj = function()
                local parent = getCurrentScreenConfiguration(nil)["ViewButtonScreens 2"]["ViewButtonScreen " .. tostring(screenNumber)]
                return getChildByIndex(nil, parent, id)
            end
        }
    )
    self.screenNumber = screenNumber
end
function HViewButton.prototype.getAssignedView(self)
    return self.context.of:HView(self:getObj():Get("Object").index)
end
____exports.HViewButton = HViewButton
return ____exports
 end,
["lib.ma_obj.HViewButtonScreen"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HBasicObject = require("lib.ma_obj.HBasicObject")
local HBasicObject = ____HBasicObject.HBasicObject
local ____HViewButton = require("lib.ma_obj.HViewButton")
local HViewButton = ____HViewButton.HViewButton
local ____Utils = require("lib.ma_obj.Utils")
local getCurrentScreenConfiguration = ____Utils.getCurrentScreenConfiguration
local HViewButtonScreen = __TS__Class()
HViewButtonScreen.name = "HViewButtonScreen"
__TS__ClassExtends(HViewButtonScreen, HBasicObject)
function HViewButtonScreen.prototype.____constructor(self, screenNumber, context)
    HBasicObject.prototype.____constructor(
        self,
        {
            context = context,
            _getObj = function()
                return getCurrentScreenConfiguration(nil)["ViewButtonScreens 2"]["ViewButtonScreen " .. tostring(screenNumber)]
            end
        }
    )
    self.screenNumber = screenNumber
end
function HViewButtonScreen.prototype.getViewButtons(self)
    return __TS__ArrayMap(
        self:getObj():Children(),
        function(____, child)
            return __TS__New(HViewButton, self.screenNumber, child.index, self.context)
        end
    )
end
function HViewButtonScreen.getViewButtonScreens(self, objectFactory)
    return __TS__ArrayMap(
        getCurrentScreenConfiguration(nil)["ViewButtonScreens 2"]:Children(),
        function(____, child)
            return objectFactory:HViewButtonScreen(child.index)
        end
    )
end
____exports.HViewButtonScreen = HViewButtonScreen
return ____exports
 end,
["lib.ma_obj.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____HAppearance = require("lib.ma_obj.HAppearance")
    local HAppearance = ____HAppearance.HAppearance
    ____exports.HAppearance = HAppearance
end
do
    local ____HCue = require("lib.ma_obj.HCue")
    local HCue = ____HCue.HCue
    ____exports.HCue = HCue
end
do
    local ____HDisplay = require("lib.ma_obj.HDisplay")
    local HDisplay = ____HDisplay.HDisplay
    ____exports.HDisplay = HDisplay
end
do
    local ____HExecutor = require("lib.ma_obj.HExecutor")
    local describeExecId = ____HExecutor.describeExecId
    local HExecutor = ____HExecutor.HExecutor
    local parseExecId = ____HExecutor.parseExecId
    ____exports.describeExecId = describeExecId
    ____exports.HExecutor = HExecutor
    ____exports.parseExecId = parseExecId
end
do
    local ____HGroup = require("lib.ma_obj.HGroup")
    local HGroup = ____HGroup.HGroup
    ____exports.HGroup = HGroup
end
do
    local ____HLayout = require("lib.ma_obj.HLayout")
    local HLayout = ____HLayout.HLayout
    ____exports.HLayout = HLayout
end
do
    local ____HLayoutElement = require("lib.ma_obj.HLayoutElement")
    local HLayoutElement = ____HLayoutElement.HLayoutElement
    ____exports.HLayoutElement = HLayoutElement
end
do
    local ____HMacro = require("lib.ma_obj.HMacro")
    local HMacro = ____HMacro.HMacro
    ____exports.HMacro = HMacro
end
do
    local ____HMacroLine = require("lib.ma_obj.HMacroLine")
    local HMacroLine = ____HMacroLine.HMacroLine
    ____exports.HMacroLine = HMacroLine
end
do
    local ____HMasterGrand = require("lib.ma_obj.HMasterGrand")
    local HMasterGrand = ____HMasterGrand.HMasterGrand
    ____exports.HMasterGrand = HMasterGrand
end
do
    local ____HMedia = require("lib.ma_obj.HMedia")
    local HMedia = ____HMedia.HMedia
    ____exports.HMedia = HMedia
end
do
    local ____HMidiRemote = require("lib.ma_obj.HMidiRemote")
    local HMidiRemote = ____HMidiRemote.HMidiRemote
    ____exports.HMidiRemote = HMidiRemote
end
do
    local ____HMidiRemotes = require("lib.ma_obj.HMidiRemotes")
    local HMidiRemotes = ____HMidiRemotes.HMidiRemotes
    ____exports.HMidiRemotes = HMidiRemotes
end
do
    local ____HPage = require("lib.ma_obj.HPage")
    local HPage = ____HPage.HPage
    ____exports.HPage = HPage
end
do
    local ____HPlugin = require("lib.ma_obj.HPlugin")
    local HPlugin = ____HPlugin.HPlugin
    ____exports.HPlugin = HPlugin
end
do
    local ____HPool = require("lib.ma_obj.HPool")
    local HPool = ____HPool.HPool
    ____exports.HPool = HPool
end
do
    local ____HPreset = require("lib.ma_obj.HPreset")
    local HPreset = ____HPreset.HPreset
    local PresetFamily = ____HPreset.PresetFamily
    ____exports.HPreset = HPreset
    ____exports.PresetFamily = PresetFamily
end
do
    local ____HScreenContent = require("lib.ma_obj.HScreenContent")
    local HScreenContent = ____HScreenContent.HScreenContent
    ____exports.HScreenContent = HScreenContent
end
do
    local ____HSequence = require("lib.ma_obj.HSequence")
    local HSequence = ____HSequence.HSequence
    ____exports.HSequence = HSequence
end
do
    local ____HView = require("lib.ma_obj.HView")
    local HView = ____HView.HView
    ____exports.HView = HView
end
do
    local ____HViewButton = require("lib.ma_obj.HViewButton")
    local HViewButton = ____HViewButton.HViewButton
    ____exports.HViewButton = HViewButton
end
do
    local ____HViewButtonScreen = require("lib.ma_obj.HViewButtonScreen")
    local HViewButtonScreen = ____HViewButtonScreen.HViewButtonScreen
    ____exports.HViewButtonScreen = HViewButtonScreen
end
do
    local ____HWindow = require("lib.ma_obj.HWindow")
    local HWindow = ____HWindow.HWindow
    ____exports.HWindow = HWindow
end
do
    local ____export = require("lib.ma_obj.types")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lib.ObjectFactory"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ma_obj = require("lib.ma_obj.index")
local HAppearance = ____ma_obj.HAppearance
local HDisplay = ____ma_obj.HDisplay
local HExecutor = ____ma_obj.HExecutor
local HGroup = ____ma_obj.HGroup
local HLayout = ____ma_obj.HLayout
local HMacro = ____ma_obj.HMacro
local HMacroLine = ____ma_obj.HMacroLine
local HMasterGrand = ____ma_obj.HMasterGrand
local HMedia = ____ma_obj.HMedia
local HMidiRemote = ____ma_obj.HMidiRemote
local HMidiRemotes = ____ma_obj.HMidiRemotes
local HPage = ____ma_obj.HPage
local HPlugin = ____ma_obj.HPlugin
local HPool = ____ma_obj.HPool
local HPreset = ____ma_obj.HPreset
local HScreenContent = ____ma_obj.HScreenContent
local HSequence = ____ma_obj.HSequence
local HView = ____ma_obj.HView
local HViewButton = ____ma_obj.HViewButton
local HViewButtonScreen = ____ma_obj.HViewButtonScreen
local HWindow = ____ma_obj.HWindow
local ____types = require("lib.ma_obj.types")
local ExecMode = ____types.ExecMode
local ____HWindowLayoutView = require("lib.ma_obj.Window.HWindowLayoutView")
local HWindowLayoutView = ____HWindowLayoutView.HWindowLayoutView
____exports.ObjectFactory = __TS__Class()
local ObjectFactory = ____exports.ObjectFactory
ObjectFactory.name = "ObjectFactory"
function ObjectFactory.prototype.____constructor(self, context)
    local ____context_undoBlock_0 = context
    if ____context_undoBlock_0 ~= nil then
        ____context_undoBlock_0 = ____context_undoBlock_0.undoBlock
    end
    local ____context_hookManager_2 = context
    if ____context_hookManager_2 ~= nil then
        ____context_hookManager_2 = ____context_hookManager_2.hookManager
    end
    local ____context_execMode_4 = context
    if ____context_execMode_4 ~= nil then
        ____context_execMode_4 = ____context_execMode_4.execMode
    end
    local ____temp_8 = ____context_execMode_4 or ExecMode.CmdLine
    local ____context_log_6 = context
    if ____context_log_6 ~= nil then
        ____context_log_6 = ____context_log_6.log
    end
    self.context = {
        undoBlock = ____context_undoBlock_0,
        hookManager = ____context_hookManager_2,
        of = self,
        execMode = ____temp_8,
        log = ____context_log_6
    }
end
function ObjectFactory.prototype.modeDirect(self)
    self.context.execMode = ExecMode.DirectLua
end
function ObjectFactory.prototype.duplicateDirectMode(self)
    local ____self_context_9 = self.context
    local undoBlock = ____self_context_9.undoBlock
    local hookManager = ____self_context_9.hookManager
    local execMode = ____self_context_9.execMode
    local log = ____self_context_9.log
    return __TS__New(____exports.ObjectFactory, {undoBlock = undoBlock, hookManager = hookManager, execMode = ExecMode.DirectLua, log = log})
end
function ObjectFactory.prototype.HAppearance(self, id)
    return __TS__New(HAppearance, id, self.context)
end
function ObjectFactory.prototype.HDisplay(self, screenNumber)
    return __TS__New(HDisplay, screenNumber, self.context)
end
function ObjectFactory.prototype.HExecutor(self, id)
    return __TS__New(HExecutor, id, self.context)
end
function ObjectFactory.prototype.HGroup(self, id)
    return __TS__New(HGroup, id, self.context)
end
function ObjectFactory.prototype.HLayout(self, id)
    return __TS__New(HLayout, id, self.context)
end
function ObjectFactory.prototype.HMacro(self, id)
    return __TS__New(HMacro, id, self.context)
end
function ObjectFactory.prototype.HMacroLine(self, macroId, lineNumber)
    return __TS__New(HMacroLine, macroId, lineNumber, self.context)
end
function ObjectFactory.prototype.HMasterGrand(self, ____type)
    return __TS__New(HMasterGrand, ____type, self.context)
end
function ObjectFactory.prototype.HMedia(self, mediaPool, id)
    return __TS__New(HMedia, mediaPool, id, self.context)
end
function ObjectFactory.prototype.HMidiRemotes(self)
    return __TS__New(HMidiRemotes, self.context)
end
function ObjectFactory.prototype.HMidiRemote(self, id)
    return __TS__New(HMidiRemote, id, self.context)
end
function ObjectFactory.prototype.HPage(self, id)
    return __TS__New(HPage, id, self.context)
end
function ObjectFactory.prototype.HPlugin(self, id)
    return __TS__New(HPlugin, id, self.context)
end
function ObjectFactory.prototype.HPool(self, poolId)
    return __TS__New(HPool, poolId, self.context)
end
function ObjectFactory.prototype.HPreset(self, presetFamily, id)
    return __TS__New(HPreset, presetFamily, id, self.context)
end
function ObjectFactory.prototype.HScreenContent(self, screenNumber)
    return __TS__New(HScreenContent, screenNumber, self.context)
end
function ObjectFactory.prototype.HSequence(self, id)
    return __TS__New(HSequence, id, self.context)
end
function ObjectFactory.prototype.HView(self, id)
    return __TS__New(HView, id, self.context)
end
function ObjectFactory.prototype.HViewButton(self, screenNumber, index)
    return __TS__New(HViewButton, screenNumber, index, self.context)
end
function ObjectFactory.prototype.HViewButtonScreen(self, screenNumber)
    return __TS__New(HViewButtonScreen, screenNumber, self.context)
end
function ObjectFactory.prototype.HWindow(self, screenNumber, windowNumber)
    return __TS__New(HWindow, screenNumber, windowNumber, self.context)
end
function ObjectFactory.prototype.HWindowLayoutView(self, screenNumber, windowNumber)
    return __TS__New(HWindowLayoutView, screenNumber, windowNumber, self.context)
end
ObjectFactory.noContext = __TS__New(____exports.ObjectFactory)
return ____exports
 end,
["lib.DebugUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Logger = require("lib.Logger")
local Logger = ____Logger.Logger
local LogLevel = ____Logger.LogLevel
local ____StringUtils = require("lib.StringUtils")
local StringUtils = ____StringUtils.StringUtils
local function objectKeys(self, t)
    local keys = {}
    for k, _v in pairs(t) do
        keys[#keys + 1] = k
    end
    return keys
end
local INDENT = "  "
function ____exports.objToString(self, obj, indent, multiline)
    if indent == nil then
        indent = 0
    end
    if multiline == nil then
        multiline = true
    end
    if type(obj) == "table" then
        if __TS__ArrayIsArray(obj) then
            return ("[" .. __TS__ArrayJoin(obj, ",")) .. "]"
        else
            local s = ""
            if #objectKeys(nil, obj) == 0 then
                s = "{}"
            else
                local keyPrefix1 = StringUtils["repeat"](StringUtils, INDENT, indent + 1)
                local keyPrefix2 = StringUtils["repeat"](StringUtils, INDENT, indent + 2)
                s = s .. "\n"
                for k, v in pairs(obj) do
                    local keyStr
                    if type(k) ~= "number" then
                        keyStr = ("\"" .. tostring(k)) .. "\""
                    end
                    s = s .. (((keyPrefix2 .. tostring(keyStr)) .. " = ") .. ____exports.objToString(nil, v, indent + 2)) .. "\n"
                end
            end
            return s
        end
    else
        return type(obj) == "string" and ("\"" .. tostring(obj)) .. "\"" or tostring(obj)
    end
end
____exports.DebugUtils = {objToString = ____exports.objToString}
--- Temporary logger with performance measurement enabled
____exports.tlog = Logger(nil, {prefix = {"TempLog"}, withElappsedTimePrefixd = true, logLevel = LogLevel.INFO})
____exports.TempLogger = function(____, params) return Logger(nil, {prefix = {params.name or "TempLogger"}, withElappsedTimePrefixd = true, logLevel = params.enabled == false and LogLevel.ERROR or LogLevel.TRACE}) end
return ____exports
 end,
["lib.MAVariables"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____json = require("json")
local decode = ____json.decode
local encode = ____json.encode
local ____DebugUtils = require("lib.DebugUtils")
local objToString = ____DebugUtils.objToString
local MAX_USER_VAR_LENGTH = 65535
function ____exports.MAVariables(self, params)
    local ____params_0 = params
    local storageType = ____params_0.storageType
    local variablesId = ____params_0.variablesId
    local function _getVars(self)
        if storageType == "UserProfile-PluginPreferences" then
            local pluginPreferences = PluginVars(variablesId)
            if pluginPreferences == nil then
                error("Could not find PluginVars with id=" .. variablesId)
            else
                return pluginPreferences(nil, variablesId)[1]
            end
        elseif storageType == "ShowFile" then
            return AddonVars(variablesId)
        else
            return UserVars()
        end
    end
    local function getVar(self, varName)
        local vars = _getVars(nil)
        return GetVar(vars, varName)
    end
    local function deleteVar(self, varName)
        local vars = _getVars(nil)
        return DelVar(vars, varName)
    end
    local function getJsonVar(self, varName)
        local value = getVar(nil, varName)
        if value == nil then
            return nil
        end
        return decode(value)
    end
    local function setVar(self, varName, value)
        assert(
            #value <= MAX_USER_VAR_LENGTH,
            string.format("setVar(): pluginId=%s, varName=%s, value exceeds length limit of ", variablesId, varName, MAX_USER_VAR_LENGTH)
        )
        local vars = _getVars(nil)
        return SetVar(vars, varName, value)
    end
    local function setJsonVar(self, varName, value)
        do
            local function ____catch(err)
                error((((("ERROR: setJsonVar(), " .. variablesId) .. ", ") .. varName) .. ". value: ") .. objToString(nil, value))
            end
            local ____try, ____hasReturned = pcall(function()
                setVar(
                    nil,
                    varName,
                    encode(value)
                )
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    return {
        variablesId = variablesId,
        getVar = getVar,
        getJsonVar = getJsonVar,
        setVar = setVar,
        setJsonVar = setJsonVar,
        deleteVar = deleteVar
    }
end
return ____exports
 end,
["lib.PersistentDataAccess"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____json = require("json")
local decode = ____json.decode
local encode = ____json.encode
local DEFAULT_IS_DIRTY_ENABLED = true
function ____exports.PersistentDataAccess(self, vars, varName, _log, options)
    local log = _log:subLogger(("PersistentDataAccess(" .. vars.variablesId) .. ")")
    local _data
    local isDirty = false
    return {
        variablesId = vars.variablesId,
        varName = varName,
        isDirty = function(self)
            local ____temp_4
            local ____options_isDirtyEnabled_0 = options
            if ____options_isDirtyEnabled_0 ~= nil then
                ____options_isDirtyEnabled_0 = ____options_isDirtyEnabled_0.isDirtyEnabled
            end
            if ____options_isDirtyEnabled_0 == nil then
                ____temp_4 = DEFAULT_IS_DIRTY_ENABLED
            else
                local ____options_isDirtyEnabled_2 = options
                if ____options_isDirtyEnabled_2 ~= nil then
                    ____options_isDirtyEnabled_2 = ____options_isDirtyEnabled_2.isDirtyEnabled
                end
                ____temp_4 = ____options_isDirtyEnabled_2
            end
            local enabled = ____temp_4
            local ____enabled_5
            if enabled then
                ____enabled_5 = isDirty
            else
                ____enabled_5 = true
            end
            return ____enabled_5
        end,
        isCachedDataExists = function(self)
            return _data ~= nil
        end,
        isDataExists = function(self)
            local dataString = vars:getVar(varName)
            local exists = dataString ~= nil
            return exists
        end,
        read = function(self)
            log:trace("read()")
            local dataString = vars:getVar(varName)
            if dataString == nil or dataString == nil then
                return false
            else
                _data = decode(dataString)
                isDirty = false
                return true
            end
        end,
        setDirty = function(self)
            if not isDirty then
                log:trace("setDirty(): was false now true")
                isDirty = true
            end
        end,
        write = function(self)
            log:trace("write() BEFORE")
            if _data == nil then
                error("PesistentDataAccess.write(): data is undefined")
            end
            vars:setVar(
                varName,
                encode(_data)
            )
            log:trace("write() AFTER")
            isDirty = false
            return self
        end,
        cleanUp = function(self)
            log:trace("delete sub-pool registry data()")
            vars:deleteVar(varName)
        end,
        getData = function(self)
            log:trace("getData()")
            if _data == nil then
                error(("PesistentDataAccess(" .. vars.variablesId) .. ").getData(): data is undefined. Probably 'read()' was not called")
            end
            return _data
        end,
        setData = function(self, data)
            log:trace("setData()")
            _data = data
            isDirty = true
            return self
        end
    }
end
return ____exports
 end,
["lib.CoroutineMutex"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.CoroutineMutex(self, log, onDestroy)
    local destroy, unlock, tryLock, lock, createCoroutine, co, selfLog, tid
    function destroy(self)
        if co ~= nil then
            local ____log_trace_result_0 = log
            if ____log_trace_result_0 ~= nil then
                ____log_trace_result_0 = ____log_trace_result_0:trace("destroy co=" .. tostring(co))
            end
            coroutine.resume(co, nil, "kill")
            co = nil
            local ____ = onDestroy and onDestroy(nil, tid)
        end
    end
    function unlock(self)
        if co ~= nil then
            local tid = tostring(coroutine.running())
            return {coroutine.resume(co, tid, "unlock")}
        end
    end
    function tryLock(self)
        if co ~= nil then
            local tid = tostring(coroutine.running())
            local res, success = coroutine.resume(co, tid, "lock")
            local ____log_trace_result_2 = log
            if ____log_trace_result_2 ~= nil then
                ____log_trace_result_2 = ____log_trace_result_2:trace((("tryLock(): res=" .. tostring(res)) .. ",success=") .. tostring(success))
            end
            return success
        end
        error("tryLock: Mutex destroyed already")
    end
    function lock(self)
        if co ~= nil then
            local ts = os.time()
            local tid = tostring(coroutine.running())
            local success = false
            repeat
                do
                    local res, success = coroutine.resume(co, tid, "lock")
                    local ____log_trace_result_4 = log
                    if ____log_trace_result_4 ~= nil then
                        ____log_trace_result_4 = ____log_trace_result_4:trace((("res=" .. tostring(res)) .. ",success=") .. tostring(success))
                    end
                    if success == true then
                        return "ok"
                    else
                        coroutine.yield()
                    end
                    if os.time() - ts > 2 then
                        return "timeout"
                    end
                end
            until success
        end
        error("not initiualized or destroyed")
    end
    function createCoroutine(self)
        return coroutine.create(function()
            local curTid
            local keepGoing = true
            local curAction = "initial"
            local requestTid
            local function isLocked()
                return curTid ~= nil
            end
            while keepGoing do
                repeat
                    local ____switch19 = curAction
                    local ____cond19 = ____switch19 == "initial"
                    if ____cond19 then
                        do
                            local _requestTid, _action = coroutine.yield()
                            requestTid = _requestTid
                            curAction = _action
                            break
                        end
                    end
                    ____cond19 = ____cond19 or ____switch19 == "kill"
                    if ____cond19 then
                        do
                            keepGoing = false
                            break
                        end
                    end
                    ____cond19 = ____cond19 or ____switch19 == "lock"
                    if ____cond19 then
                        do
                            if isLocked(nil) then
                                local _requestTid, _action = coroutine.yield(false)
                                requestTid = _requestTid
                                curAction = _action
                            else
                                curTid = requestTid
                                local _requestTid, _action = coroutine.yield(true)
                                requestTid = _requestTid
                                curAction = _action
                            end
                            break
                        end
                    end
                    ____cond19 = ____cond19 or ____switch19 == "unlock"
                    if ____cond19 then
                        do
                            curTid = nil
                            local _requestTid, _action = coroutine.yield(true)
                            requestTid = _requestTid
                            curAction = _action
                            break
                        end
                    end
                until true
            end
            local ____selfLog_trace_result_6 = selfLog
            if ____selfLog_trace_result_6 ~= nil then
                ____selfLog_trace_result_6 = ____selfLog_trace_result_6:trace("coroutine ended co=" .. tostring(co))
            end
        end)
    end
    co = createCoroutine(nil)
    selfLog = log
    coroutine.resume(co)
    tid = tostring(co)
    return {
        tid = tid,
        lock = lock,
        tryLock = tryLock,
        unlock = unlock,
        destroy = destroy
    }
end
return ____exports
 end,
["lib.MutexFactory.MutexFactory"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____CoroutineMutex = require("lib.CoroutineMutex")
local CoroutineMutex = ____CoroutineMutex.CoroutineMutex
local ____Utils = require("lib.Utils")
local objectValues = ____Utils.objectValues
function ____exports.MutexFactory(self, factoryLog)
    local create, cleanup, mutexInstances
    function create(self, log)
        local cm = CoroutineMutex(
            nil,
            log,
            function(____, tid)
                factoryLog:trace("Deleting " .. tid)
                __TS__Delete(mutexInstances, tid)
            end
        )
        factoryLog:trace("Created " .. cm.tid)
        mutexInstances[cm.tid] = cm
        return cm
    end
    function cleanup(self)
        for ____, cm in ipairs(objectValues(nil, mutexInstances)) do
            cm:destroy()
        end
    end
    mutexInstances = {}
    return {create = create, cleanup = cleanup}
end
return ____exports
 end,
["lib.MutexFactory.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____MutexFactory = require("lib.MutexFactory.MutexFactory")
    local MutexFactory = ____MutexFactory.MutexFactory
    ____exports.MutexFactory = MutexFactory
end
return ____exports
 end,
["lib.plugin.PluginEnv"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.PluginEnv = __TS__Class()
local PluginEnv = ____exports.PluginEnv
PluginEnv.name = "PluginEnv"
function PluginEnv.prototype.____constructor(self, params)
    self.author = params.author
    self.env = params.env
    self.pluginName = params.pluginName
    self.pluginId = params.pluginId
    self.pluginVersion = params.pluginVersion
end
function PluginEnv.prototype.getNameAndVersionAsLabel(self)
    return (((self.pluginName .. " v") .. __TS__StringReplaceAll(self.pluginVersion, ".", "_")) .. " ") .. (self.env == "dev" and "DEV" or "")
end
return ____exports
 end,
["lib.EventEmitter"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.EventEmitter = __TS__Class()
local EventEmitter = ____exports.EventEmitter
EventEmitter.name = "EventEmitter"
function EventEmitter.prototype.____constructor(self)
    self.eventsListeners = {}
end
function EventEmitter.prototype.on(self, eventName, listener)
    if type(self.eventsListeners[eventName]) ~= "table" then
        self.eventsListeners[eventName] = {}
    end
    local listeners = self.eventsListeners[eventName]
    if not __TS__ArrayIncludes(listeners, listener) then
        listeners[#listeners + 1] = listener
    end
    return function() return self:removeListener(eventName, listener) end
end
function EventEmitter.prototype.removeListener(self, eventName, listener)
    if type(self.eventsListeners[eventName]) ~= "table" then
        return
    end
    local idx = __TS__ArrayIndexOf(self.eventsListeners[eventName], listener)
    if idx > -1 then
        __TS__ArraySplice(self.eventsListeners[eventName], idx, 1)
    end
end
function EventEmitter.prototype.removeAllListeners(self)
    __TS__ArrayForEach(
        __TS__ObjectKeys(self.eventsListeners),
        function(____, event) return __TS__ArraySplice(self.eventsListeners[event], 0, #self.eventsListeners[event]) end
    )
end
function EventEmitter.prototype.emit(self, event)
    if type(self.eventsListeners[event.eventName]) ~= "table" then
        return
    end
    local lastErr
    __TS__ArrayForEach(
        {table.unpack(self.eventsListeners[event.eventName])},
        function(____, listener, index)
            do
                local function ____catch(err)
                    lastErr = err
                end
                local ____try, ____hasReturned = pcall(function()
                    listener(
                        self,
                        table.unpack({event})
                    )
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    )
    if lastErr ~= nil then
        error(lastErr, 0)
    end
end
function EventEmitter.prototype.once(self, event, listener)
    local remove
    remove = self:on(
        event.eventName,
        function(____, ...)
            remove(nil)
            listener(
                self,
                table.unpack({event})
            )
        end
    )
    return remove
end
return ____exports
 end,
["lib.PluginInfo"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.PluginInfo(self, ...)
    local args = {...}
    return {pluginObjectName = args[1], componentName = args[2], signalTable = args[3], componentHandle = args[4]}
end
return ____exports
 end,
["lib.SingletonFactory"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAVariables = require("lib.MAVariables")
local MAVariables = ____MAVariables.MAVariables
local INSTANCE_ID_VAR_NAME = "SINGLETON_FACTORY_INSTANCE_ID"
local GlobalVariable = _G
local function getId(self, instance)
    return tostring(instance)
end
function ____exports.isShowSingletonExists(self, globalId)
    return GlobalVariable[globalId] ~= nil
end
function ____exports.getShowSingleton(self, globalId)
    local instance = GlobalVariable[globalId]
    assert(instance ~= nil, "Could not find Show Singleton globalId = " .. globalId)
    return instance
end
function ____exports.getOrCreateShowSingleton(self, globalId, create)
    local pluginAddonVars = MAVariables(nil, {storageType = "ShowFile", variablesId = globalId})
    local function createInstance(self)
        local instance = create(nil)
        local objId = getId(nil, instance)
        pluginAddonVars:setVar(INSTANCE_ID_VAR_NAME, objId)
        return instance
    end
    if GlobalVariable[globalId] == nil then
        GlobalVariable[globalId] = createInstance(nil)
    else
        local instance = GlobalVariable[globalId]
        if pluginAddonVars:getVar(INSTANCE_ID_VAR_NAME) ~= getId(nil, instance) then
            instance:destroy()
            GlobalVariable[globalId] = createInstance(nil)
        end
    end
    return GlobalVariable[globalId]
end
return ____exports
 end,
["lib.plugin.AssetManager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ma_obj = require("lib.ma_obj.index")
local MediaPool = ____ma_obj.MediaPool
local ____MAPoolsInfo = require("lib.MAPoolsInfo")
local MAPoolsInfo = ____MAPoolsInfo.MAPoolsInfo
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local objectValues = ____Utils.objectValues
function ____exports.AssetManager(self, params)
    local ____params_0 = params
    local assets = ____params_0.assets
    local findAvailableRange = ____params_0.findAvailableRange
    local of = ____params_0.of
    local log = ____params_0.log
    --- Get an asset index
    -- 
    -- @param type
    -- @param index 0-based
    local function getAssetId(self, ____type, poolId, index)
        local poolAssets = assets[poolId]
        if poolAssets == nil then
            error(log:msg(((("getAssetId(poolId: " .. poolId) .. ", type: ") .. ____type) .. "): poolId not provisioned at all"))
        end
        local assetBatch = poolAssets[____type]
        if assetBatch == nil then
            error(log:msg(((("getAssetId(poolId: " .. poolId) .. ", type: ") .. ____type) .. "): type not found"))
        else
            if index < assetBatch.size then
                return assetBatch.start + index
            else
                error(log:msg((((((("getAssetId(poolId: " .. poolId) .. ", type: ") .. ____type) .. ", index: ") .. tostring(index)) .. "): index exceeds provisioned batch size of ") .. tostring(assetBatch.size)))
            end
        end
    end
    local function provisionOrGetAssetIds(self, ____type, poolId, size)
        local poolAssets = assets[poolId]
        if poolAssets == nil then
            poolAssets = {}
            assets[poolId] = poolAssets
        end
        if __TS__ArrayIncludes(
            objectKeys(nil, poolAssets),
            ____type
        ) then
            return poolAssets[____type]
        else
            local range = findAvailableRange(nil, poolId, size)
            if range == nil then
                error(log:msg((((("Could not find available asset range (size=" .. tostring(size)) .. ") in pool ") .. poolId) .. ", for asset ") .. ____type))
            end
            poolAssets[____type] = range
            return range
        end
    end
    local function provisionSingleAssetId(self, ____type, poolId)
        local poolAssets = assets[poolId]
        if poolAssets == nil then
            poolAssets = {}
            assets[poolId] = poolAssets
        end
        if __TS__ArrayIncludes(
            objectKeys(nil, poolAssets),
            ____type
        ) then
            error(log:msg((("AssetsManager: asset id " .. ____type) .. " already exists for poolId: ") .. poolId))
        else
            local range = findAvailableRange(nil, poolId, 1)
            if range == nil then
                error(log:msg((((("Plugin " .. poolId) .. " allowance exceeded. Please increase generated Macro allowance in the plugin configuraiton. Could not find available asset range in pool ") .. poolId) .. ", for asset ") .. ____type))
            end
            poolAssets[____type] = range
            return range.start
        end
    end
    local function isProvisioned(self, ____type, poolId, size)
        local poolAssets = assets[poolId]
        if poolAssets == nil then
            return false
        end
        local assetBatch = poolAssets[____type]
        if assetBatch == nil then
            return false
        else
            if size <= assetBatch.size then
                return true
            else
                return false
            end
        end
    end
    local function provisionOrGet(self, ____type, poolId)
        if isProvisioned(nil, ____type, poolId, 1) then
            return getAssetId(nil, ____type, poolId, 0)
        else
            return provisionSingleAssetId(nil, ____type, poolId)
        end
    end
    return {
        execModeDirectLua = function(self)
            params.of:modeDirect()
        end,
        reportProvisionedAsset = function(____, poolId, index)
            local poolAssets = assets[poolId]
            if poolAssets == nil then
                poolAssets = {}
                assets[poolId] = poolAssets
            end
            local ____type = "__INTERNAL_" .. tostring(index)
            if __TS__ArrayIncludes(
                objectKeys(nil, poolAssets),
                ____type
            ) then
            else
                poolAssets[____type] = {start = index, size = 1}
            end
        end,
        provisionSingleAssetId = provisionSingleAssetId,
        provisionOrGetAssetIds = provisionOrGetAssetIds,
        getAssetId = getAssetId,
        getSingleAssetId = function(____, ____type, poolId) return getAssetId(nil, ____type, poolId, 0) end,
        isProvisioned = isProvisioned,
        deleteAll = function(____, undo)
            local poolsInfo = MAPoolsInfo(nil)
            local ____error = nil
            for ____, poolId in ipairs(objectKeys(nil, assets)) do
                local poolBatchs = assets[poolId]
                local poolInfo = poolsInfo:byId(poolId)
                if poolBatchs ~= nil then
                    for ____, assetBatchRange in ipairs(objectValues(nil, poolBatchs)) do
                        local startAddr = ((poolInfo.keyword .. " ") .. (poolInfo.subPoolIndex == nil and "" or tostring(poolInfo.subPoolIndex) .. ".")) .. tostring(assetBatchRange.start)
                        local ____temp_1
                        if assetBatchRange.size == 1 then
                            ____temp_1 = undo.cmdFailable(("Delete " .. startAddr) .. " /nc")
                        else
                            ____temp_1 = undo.cmdFailable(((("Delete " .. startAddr) .. " Thru ") .. tostring(assetBatchRange.start + assetBatchRange.size - 1)) .. " /nc")
                        end
                        local commandResult = ____temp_1
                        if commandResult ~= nil and ____error == nil then
                            ____error = commandResult
                        end
                    end
                end
                __TS__Delete(assets, poolId)
            end
            return ____error
        end,
        delete = function(____, undo, poolId, assetType)
            local poolsInfo = MAPoolsInfo(nil)
            local poolBatchs = assets[poolId]
            local poolInfo = poolsInfo:byId(poolId)
            if poolBatchs ~= nil then
                local batch = poolBatchs[assetType]
                if batch ~= nil then
                    local startAddr = ((poolInfo.keyword .. " ") .. (poolInfo.subPoolIndex == nil and "" or tostring(poolInfo.subPoolIndex) .. ".")) .. tostring(batch.start)
                    local ____temp_2
                    if batch.size == 1 then
                        ____temp_2 = undo.cmdFailable(("Delete " .. startAddr) .. " /nc")
                    else
                        ____temp_2 = undo.cmdFailable(((("Delete " .. startAddr) .. " Thru ") .. tostring(batch.start + batch.size - 1)) .. " /nc")
                    end
                    local commandResult = ____temp_2
                    if commandResult ~= nil then
                        error(log:msg((("Error deleteing " .. poolId) .. ", assetType=") .. assetType))
                    else
                        __TS__Delete(poolBatchs, assetType)
                    end
                end
            end
        end,
        get = {
            appearance = function(____, ____type, index) return of:HAppearance(getAssetId(nil, ____type, "Appearances", index or 0)) end,
            image = function(____, ____type, index) return of:HMedia(
                MediaPool.Images,
                getAssetId(nil, ____type, "Images", index or 0)
            ) end,
            layout = function(____, ____type, index) return of:HLayout(getAssetId(nil, ____type, "Layouts", index or 0)) end,
            macro = function(____, ____type, index) return of:HMacro(getAssetId(nil, ____type, "Macros", index or 0)) end,
            page = function(____, ____type, index) return of:HPage(getAssetId(nil, ____type, "Pages", index or 0)) end,
            preset = function(____, ____type, presetFamily, index) return of:HPreset(
                presetFamily,
                getAssetId(
                    nil,
                    ____type,
                    MAPoolsInfo(nil):byPresetFamily(presetFamily),
                    index or 0
                )
            ) end,
            sequence = function(____, ____type, index) return of:HSequence(getAssetId(nil, ____type, "Sequences", index or 0)) end,
            view = function(____, ____type, index) return of:HView(getAssetId(nil, ____type, "Views", index or 0)) end
        },
        provisionOrGet = {
            appearance = function(____, ____type) return of:HAppearance(provisionOrGet(nil, ____type, "Appearances")) end,
            image = function(____, ____type) return of:HMedia(
                MediaPool.Images,
                provisionOrGet(nil, ____type, "Images")
            ) end,
            layout = function(____, ____type) return of:HLayout(provisionOrGet(nil, ____type, "Layouts")) end,
            macro = function(____, ____type) return of:HMacro(provisionOrGet(nil, ____type, "Macros")) end,
            page = function(____, ____type) return of:HPage(provisionOrGet(nil, ____type, "Pages")) end,
            preset = function(____, ____type, presetFamily) return of:HPreset(
                presetFamily,
                provisionOrGet(
                    nil,
                    ____type,
                    MAPoolsInfo(nil):byPresetFamily(presetFamily)
                )
            ) end,
            sequence = function(____, ____type) return of:HSequence(provisionOrGet(nil, ____type, "Sequences")) end,
            view = function(____, ____type) return of:HView(provisionOrGet(nil, ____type, "Views")) end
        }
    }
end
return ____exports
 end,
["lib.XmlUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____parseXml = require("lib.parseXml")
local collect = ____parseXml.collect
local function dumpXmlNode(self, node)
    Printf("label:" .. tostring(node.label))
    if node.xarg ~= nil then
        Printf("xarg: ")
        for k, v in pairs(node.xarg) do
            Printf(((("  [" .. tostring(k)) .. ": ") .. tostring(v)) .. "]")
        end
    end
    for ____, child in ipairs(node) do
        dumpXmlNode(nil, child)
    end
end
____exports.XmlUtils = {parseXml = collect, dumpXmlNode = dumpXmlNode}
return ____exports
 end,
["lib.parseXml"] = function(...) 
-- Taken from here: http://lua-users.org/wiki/LuaXml
local Parser = {}

function parseargs(s)
    local arg = {}
    string.gsub(s, "([%-%w]+)=([\"'])(.-)%2", function(w, _, a)
        arg[w] = a
    end)
    return arg
end

function Parser:collect(s)
    local stack = {}
    local top = {}
    table.insert(stack, top)
    local ni, c, label, xarg, empty
    local i, j = 1, 1
    while true do
        ni, j, c, label, xarg, empty = string.find(s,
                                                   "<(%/?)([%w:]+)(.-)(%/?)>", i)
        if not ni then
            break
        end
        local text = string.sub(s, i, ni - 1)
        if not string.find(text, "^%s*$") then
            table.insert(top, text)
        end
        if empty == "/" then -- empty element tag
            table.insert(top, {label = label, xarg = parseargs(xarg), empty = 1})
        elseif c == "" then -- start tag
            top = {label = label, xarg = parseargs(xarg)}
            table.insert(stack, top) -- new level
        else -- end tag
            local toclose = table.remove(stack) -- remove top
            top = stack[#stack]
            if #stack < 1 then
                error("nothing to close with " .. label)
            end
            if toclose.label ~= label then
                error("trying to close " .. toclose.label .. " with " .. label)
            end
            table.insert(top, toclose)
        end
        i = j + 1
    end
    local text = string.sub(s, i)
    if not string.find(text, "^%s*$") then
        table.insert(stack[#stack], text)
    end
    if #stack > 1 then
        error("unclosed " .. stack[#stack].label)
    end
    return stack[1]
end

return Parser
 end,
["lib.FileUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____lfs = require("lfs")
local attributes = ____lfs.attributes
local dir = ____lfs.dir
local mkdir = ____lfs.mkdir
local rmdir = ____lfs.rmdir
local PATH_SEPERATOR = "/"
local function makeDir(self, path)
    return mkdir(path)
end
local function path(self, ...)
    local pathParts = {...}
    return table.concat(pathParts, PATH_SEPERATOR or ",")
end
local function readFile(self, filePath)
    local temp = io.input()
    io.input(filePath)
    local fileContent = io.read("a")
    io.input():close()
    io.input(temp)
    return fileContent
end
local function openFileForWriting(self, fileName)
    local fileWrapper = assert({io.open(fileName, "w")})
    local file = table.unpack(fileWrapper)
    return file
end
local function writeBinaryFile(self, fileName, data)
    local out = io.open(fileName, "wb")
    if out == nil then
        error("Could not open file for binary writing: " .. fileName)
    else
        local _, err = out:write(data)
        assert(
            err == nil,
            "Could not write to file: " .. tostring(err)
        )
        assert(out:close())
    end
end
local function writeLine(self, fp, line)
    fp:write(line)
    fp:write("\n")
end
local function closeFile(self, fp)
    fp:flush()
    fp:close()
end
local function escapeObjNameForPath(self, name)
    return __TS__StringReplace(name, "/", "_")
end
function ____exports.escapeFileName(self, name)
    return name:gsub("[,'`]", "_")
end
local function exists(self, path)
    return attributes(path) ~= nil
end
local function isDir(self, path)
    return attributes(path).mode == "directory"
end
--- Get directory content
-- Taken from gma3_helpers.lua
local function getDirectoryContent(self, path)
    local resTable = {}
    for file in dir(path) do
        if file ~= "." and file ~= ".." then
            local currentPath = (path .. GetPathSeparator()) .. file
            local attr = attributes(currentPath)
            assert(type(attr) == "table")
            if attr.mode == "directory" then
                resTable[#resTable + 1] = {type = "directory", fullPath = currentPath, name = file}
            else
                resTable[#resTable + 1] = {type = "file", fullPath = currentPath, name = file}
            end
        end
    end
    return resTable
end
function ____exports.removeDirectory(self, folder)
    for file in dir(folder) do
        local file_path = path(nil, folder, file)
        if file ~= "." and file ~= ".." then
            if attributes(file_path).mode == "file" then
                os.remove(file_path)
            elseif attributes(file_path).mode == "directory" then
                ____exports.removeDirectory(nil, file_path)
            end
        end
    end
    rmdir(folder)
end
____exports.FileUtils = {
    closeFile = closeFile,
    escapeObjNameForPath = escapeObjNameForPath,
    exists = exists,
    isDir = isDir,
    getDirectoryContent = getDirectoryContent,
    makeDir = makeDir,
    openFileForWriting = openFileForWriting,
    path = path,
    readFile = readFile,
    writeLine = writeLine,
    writeBinaryFile = writeBinaryFile
}
return ____exports
 end,
["lib.image.ImageLibraryAccess"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____XmlUtils = require("lib.XmlUtils")
local XmlUtils = ____XmlUtils.XmlUtils
local ____FileUtils = require("lib.FileUtils")
local FileUtils = ____FileUtils.FileUtils
local removeDirectory = ____FileUtils.removeDirectory
local ____base64Codec = require("lib.image.base64Codec")
local decode = ____base64Codec.decode
--- Craete Image Importer
-- Runs the "UpdateContent" command which makes MA3 generate XML file for each image in the image library.
-- Then resolves which XML belongs to which image file.
-- 
-- @returns An Importer that can be used to import images by their original file name.
function ____exports.ImageLibraryAccess(self, pluginId, log)
    local imageLibraryPath = FileUtils:path(
        GetPath(Enums.PathType.ImageLibrary),
        pluginId
    )
    local function getImageFileName(self, originalFileName)
        return (pluginId .. "_") .. originalFileName
    end
    local function writeToImageLibrary(self, images)
        __TS__ArrayForEach(
            images,
            function(____, image)
                local path = FileUtils:path(
                    imageLibraryPath,
                    getImageFileName(nil, image.fileName)
                )
                FileUtils:writeBinaryFile(
                    path,
                    decode(image.sourceBase64)
                )
            end
        )
        Cmd("UpdateContent image \"Images\"")
    end
    local function indexLibraryFile(self)
        local files = FileUtils:getDirectoryContent(imageLibraryPath)
        local xmlFileNameByImageFileName = {}
        __TS__ArrayForEach(
            files,
            function(____, file)
                if __TS__StringEndsWith(file.name, ".png.xml") then
                    local content = FileUtils:readFile(file.fullPath)
                    local presetsXmlNode = XmlUtils:parseXml(content)
                    local root = presetsXmlNode[2]
                    local userImageNode = root[1]
                    local imageFileName = userImageNode.xarg.FileName
                    xmlFileNameByImageFileName[imageFileName] = file.name
                end
            end
        )
        return xmlFileNameByImageFileName
    end
    local function deleteAllImages(self)
        if FileUtils:exists(imageLibraryPath) and FileUtils:isDir(imageLibraryPath) then
            removeDirectory(nil, imageLibraryPath)
        else
            log:warn("deleteAllImages: The plugin's Image library folder was aobut to be deleted, but it didn't exist. Folder path = " .. imageLibraryPath)
        end
    end
    return {
        deleteAllImages = deleteAllImages,
        imageLibraryPath = imageLibraryPath,
        writeToImageLibrary = writeToImageLibrary,
        importImages = function(____, images)
            local xmlFileNameByImageFileName = indexLibraryFile(nil)
            for ____, image in ipairs(images) do
                local xmlFileName = xmlFileNameByImageFileName[getImageFileName(nil, image.imageFileName)]
                if xmlFileName == nil then
                    error((("Import " .. image.imageFileName) .. " failed. a corresponding XML file was not found under ") .. imageLibraryPath)
                end
                Cmd(((((("Import Image \"Images\"." .. tostring(image.targetIndex)) .. " /File \"") .. xmlFileName) .. "\" /Path \"") .. imageLibraryPath) .. "\" /nc")
            end
        end
    }
end
return ____exports
 end,
["lib.image.base64Codec"] = function(...) 
--[[

    base64 -- v1.5.3 public domain Lua base64 encoder/decoder
    no warranty implied; use at your own risk
   
    Needs bit32.extract function. If not present it's implemented using BitOp
    or Lua 5.3 native bit operators. For Lua 5.1 fallbacks to pure Lua
    implementation inspired by Rici Lake's post:
      http://ricilake.blogspot.co.uk/2007/10/iterating-bits-in-lua.html
   
    author: Ilya Kolbin (iskolbin@gmail.com)
    url: github.com/iskolbin/lbase64
   
    COMPATIBILITY
   
    Lua 5.1+, LuaJIT
   
    LICENSE
   
    See end of file for license information.
   
   --]] local base64 = {}

local extract = _G.bit32 and _G.bit32.extract -- Lua 5.2/Lua 5.3 in compatibility mode
if not extract then
    if _G.bit then -- LuaJIT
        local shl, shr, band = _G.bit.lshift, _G.bit.rshift, _G.bit.band
        extract = function(v, from, width)
            return band(shr(v, from), shl(1, width) - 1)
        end
    elseif _G._VERSION == "Lua 5.1" then
        extract = function(v, from, width)
            local w = 0
            local flag = 2 ^ from
            for i = 0, width - 1 do
                local flag2 = flag + flag
                if v % flag2 >= flag then
                    w = w + 2 ^ i
                end
                flag = flag2
            end
            return w
        end
    else -- Lua 5.3+
        extract = load [[return function( v, from, width )
               return ( v >> from ) & ((1 << width) - 1)
           end]]()
    end
end

function base64.makeencoder(s62, s63, spad)
    local encoder = {}
    for b64code, char in pairs {
        [0] = 'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'J',
        'K',
        'L',
        'M',
        'N',
        'O',
        'P',
        'Q',
        'R',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z',
        'a',
        'b',
        'c',
        'd',
        'e',
        'f',
        'g',
        'h',
        'i',
        'j',
        'k',
        'l',
        'm',
        'n',
        'o',
        'p',
        'q',
        'r',
        's',
        't',
        'u',
        'v',
        'w',
        'x',
        'y',
        'z',
        '0',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        s62 or '+',
        s63 or '/',
        spad or '='
    } do
        encoder[b64code] = char:byte()
    end
    return encoder
end

function base64.makedecoder(s62, s63, spad)
    local decoder = {}
    for b64code, charcode in pairs(base64.makeencoder(s62, s63, spad)) do
        decoder[charcode] = b64code
    end
    return decoder
end

local DEFAULT_ENCODER = base64.makeencoder()
local DEFAULT_DECODER = base64.makedecoder()

local char, concat = string.char, table.concat

function base64.encode(str, encoder, usecaching)
    encoder = encoder or DEFAULT_ENCODER
    local t, k, n = {}, 1, #str
    local lastn = n % 3
    local cache = {}
    for i = 1, n - lastn, 3 do
        local a, b, c = str:byte(i, i + 2)
        local v = a * 0x10000 + b * 0x100 + c
        local s
        if usecaching then
            s = cache[v]
            if not s then
                s = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)],
                         encoder[extract(v, 6, 6)], encoder[extract(v, 0, 6)])
                cache[v] = s
            end
        else
            s = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)],
                     encoder[extract(v, 6, 6)], encoder[extract(v, 0, 6)])
        end
        t[k] = s
        k = k + 1
    end
    if lastn == 2 then
        local a, b = str:byte(n - 1, n)
        local v = a * 0x10000 + b * 0x100
        t[k] = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)],
                    encoder[extract(v, 6, 6)], encoder[64])
    elseif lastn == 1 then
        local v = str:byte(n) * 0x10000
        t[k] = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)],
                    encoder[64], encoder[64])
    end
    return concat(t)
end

function base64.decode(b64, decoder, usecaching)
    decoder = decoder or DEFAULT_DECODER
    local pattern = '[^%w%+%/%=]'
    if decoder then
        local s62, s63
        for charcode, b64code in pairs(decoder) do
            if b64code == 62 then
                s62 = charcode
            elseif b64code == 63 then
                s63 = charcode
            end
        end
        pattern = ('[^%%w%%%s%%%s%%=]'):format(char(s62), char(s63))
    end
    b64 = b64:gsub(pattern, '')
    local cache = usecaching and {}
    local t, k = {}, 1
    local n = #b64
    local padding = b64:sub(-2) == '==' and 2 or b64:sub(-1) == '=' and 1 or 0
    for i = 1, padding > 0 and n - 4 or n, 4 do
        local a, b, c, d = b64:byte(i, i + 3)
        local s
        if usecaching then
            local v0 = a * 0x1000000 + b * 0x10000 + c * 0x100 + d
            s = cache[v0]
            if not s then
                local v = decoder[a] * 0x40000 + decoder[b] * 0x1000 +
                              decoder[c] * 0x40 + decoder[d]
                s = char(extract(v, 16, 8), extract(v, 8, 8), extract(v, 0, 8))
                cache[v0] = s
            end
        else
            local v = decoder[a] * 0x40000 + decoder[b] * 0x1000 + decoder[c] *
                          0x40 + decoder[d]
            s = char(extract(v, 16, 8), extract(v, 8, 8), extract(v, 0, 8))
        end
        t[k] = s
        k = k + 1
    end
    if padding == 1 then
        local a, b, c = b64:byte(n - 3, n - 1)
        local v = decoder[a] * 0x40000 + decoder[b] * 0x1000 + decoder[c] * 0x40
        t[k] = char(extract(v, 16, 8), extract(v, 8, 8))
    elseif padding == 2 then
        local a, b = b64:byte(n - 3, n - 2)
        local v = decoder[a] * 0x40000 + decoder[b] * 0x1000
        t[k] = char(extract(v, 16, 8))
    end
    return concat(t)
end

return base64

--[[
   ------------------------------------------------------------------------------
   This software is available under 2 licenses -- choose whichever you prefer.
   ------------------------------------------------------------------------------
   ALTERNATIVE A - MIT License
   Copyright (c) 2018 Ilya Kolbin
   Permission is hereby granted, free of charge, to any person obtaining a copy of
   this software and associated documentation files (the "Software"), to deal in
   the Software without restriction, including without limitation the rights to
   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
   of the Software, and to permit persons to whom the Software is furnished to do
   so, subject to the following conditions:
   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
   ------------------------------------------------------------------------------
   ALTERNATIVE B - Public Domain (www.unlicense.org)
   This is free and unencumbered software released into the public domain.
   Anyone is free to copy, modify, publish, use, compile, sell, or distribute this
   software, either in source code form or as a compiled binary, for any purpose,
   commercial or non-commercial, and by any means.
   In jurisdictions that recognize copyright laws, the author or authors of this
   software dedicate any and all copyright interest in the software to the public
   domain. We make this dedication for the benefit of the public at large and to
   the detriment of our heirs and successors. We intend this dedication to be an
   overt act of relinquishment in perpetuity of all present and future rights to
   this software under copyright law.
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
   ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
   WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   ------------------------------------------------------------------------------
   --]]
 end,
["lib.plugin.ExternalActionCommandFactory"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ExternalCommandCodecV2 = require("lib.ExternalCommandCodecV2")
local ActionCodec = ____ExternalCommandCodecV2.ActionCodec
function ____exports.ExternalActionCommandFactory(self, pluginInfo, componentNumber)
    local function create(self, action)
        local encodedAction = ActionCodec:encodeAction(action)
        return ((((("Plugin \"" .. pluginInfo.pluginObjectName) .. "\".") .. tostring(componentNumber)) .. " \"") .. encodedAction) .. "\""
    end
    return {create = create}
end
return ____exports
 end,
["lib.ExternalCommandCodec"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__TypeOf = ____lualib.__TS__TypeOf
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local SEPERATOR = ","
local function encodeParam(self, param)
    if type(param) == "number" then
        return tostring(param)
    elseif type(param) == "string" then
        return param
    elseif type(param) == "boolean" then
        return param and "__true" or "__false"
    else
        error("PluginUtils:encodeParam() Unsupported type " .. __TS__TypeOf(param))
    end
end
function ____exports.encodeParams(self, params)
    local s = ""
    for k, v in ipairs(params) do
        local seperator = k == 1 and "" or SEPERATOR
        s = (s .. seperator) .. encodeParam(nil, v)
    end
    return s
end
local function decodeParam(self, param)
    local numParam = tonumber(param)
    if numParam ~= nil then
        return numParam
    else
        if param == "__true" then
            return true
        elseif param == "__false" then
            return false
        else
            return param
        end
    end
end
--- decodeParams
-- 
-- @param encodedParams string comma separated params
-- @return table array of decoded params. decodes numbers.
function ____exports.decodeParams(self, encodedParams)
    local parts = __TS__StringSplit(encodedParams, SEPERATOR)
    return __TS__ArrayMap(
        parts,
        function(____, s) return decodeParam(nil, s) end
    )
end
---
-- @param encodedParams string comma separated params
-- @return table array of decoded params. does not decode numbers.
function ____exports.decodeParamsAsStrings(self, encodedParams)
    return __TS__StringSplit(encodedParams, SEPERATOR)
end
return ____exports
 end,
["lib.plugin.PluginUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAVariables = require("lib.MAVariables")
local MAVariables = ____MAVariables.MAVariables
local ____ExternalCommandCodec = require("lib.ExternalCommandCodec")
local decodeParams = ____ExternalCommandCodec.decodeParams
local decodeParamsAsStrings = ____ExternalCommandCodec.decodeParamsAsStrings
local encodeParams = ____ExternalCommandCodec.encodeParams
--- Plugin Utils : Log, Assert, Persist
-- 
-- @param pluginName A display name for the plugin
-- @param pluginId a unique plugin ID (same id will be used also if plugin is copied)
-- @returns
function ____exports.PluginUtils(self, pluginEnv, pluginInfo)
    local ____pluginInfo_0 = pluginInfo
    local pluginName = ____pluginInfo_0.pluginObjectName
    local ____pluginEnv_1 = pluginEnv
    local pluginId = ____pluginEnv_1.pluginId
    local pluginVars = MAVariables(nil, {storageType = "ShowFile", variablesId = pluginId})
    local pluginHandle = pluginInfo.componentHandle:Parent()
    local function _assert(self, condition, msg)
        local prefixedMsg = (pluginName .. " [ERROR]: ") .. msg
        local _condition, _ = assert(condition, prefixedMsg)
        return _condition
    end
    local function _assertDefined(self, value, msg)
        local prefixedMsg = (pluginName .. " [ERROR]: ") .. msg
        assert(value ~= nil, prefixedMsg)
    end
    local function _printf(self, msg)
        Printf((pluginName .. ": ") .. msg)
    end
    local function _echo(self, msg)
        Echo((pluginName .. ": ") .. msg)
    end
    local function _error(self, msg)
        error((pluginName .. ": ") .. msg)
    end
    local function createCmdRunPluginCompononentWithParams(self, args)
        local encodedParams = encodeParams(nil, args.params)
        return ((((("Plugin \"" .. args.pluginName) .. "\".") .. tostring(args.compNumber)) .. " \"") .. encodedParams) .. "\""
    end
    local function createCmdRunOwnPluginCompononentWithParams(self, args)
        return createCmdRunPluginCompononentWithParams(
            nil,
            __TS__ObjectAssign({}, args, {pluginName = pluginName})
        )
    end
    return {
        assert = _assert,
        assertDefined = _assertDefined,
        printf = _printf,
        echo = _echo,
        error = _error,
        getVar = pluginVars.getVar,
        setVar = pluginVars.setVar,
        deleteVar = pluginVars.deleteVar,
        setJsonVar = pluginVars.setJsonVar,
        getJsonVar = pluginVars.getJsonVar,
        createCmdRunPluginCompononentWithParams = createCmdRunPluginCompononentWithParams,
        createCmdRunOwnPluginCompononentWithParams = createCmdRunOwnPluginCompononentWithParams,
        decodePluginArgument = decodeParams,
        decodePluginArgumentAsStrings = decodeParamsAsStrings,
        pluginVars = pluginVars,
        pluginId = pluginId,
        pluginEnv = pluginEnv,
        pluginInfo = pluginInfo,
        pluginHandle = pluginHandle
    }
end
return ____exports
 end,
["lib.plugin.PluginAssetManager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local objectValues = ____Utils.objectValues
local ____AssetManager = require("lib.plugin.AssetManager")
local AssetManager = ____AssetManager.AssetManager
function ____exports.PluginAssetManager(self, params)
    local ____params_0 = params
    local of = ____params_0.of
    local _log = ____params_0.log
    local pluginData = ____params_0.pluginData
    local subPoolRegistry = ____params_0.subPoolRegistry
    local pu = ____params_0.pu
    local log = _log:subLogger("PluginAssetManager")
    local function getProvisionedPoolIds(self)
        local poolIds = objectKeys(nil, pluginData.pluginAssets)
        for ____, instance in ipairs(objectValues(nil, pluginData.instances)) do
            __TS__ArrayForEach(
                objectKeys(nil, instance.assets),
                function(____, poolId)
                    if not __TS__ArrayIncludes(poolIds, poolId) then
                        poolIds[#poolIds + 1] = poolId
                    end
                end
            )
        end
        return poolIds
    end
    local function getAllProvisionIds(self, poolId)
        local provisionedIndice = {}
        local pluginAssets = pluginData.pluginAssets[poolId]
        if pluginAssets ~= nil then
            __TS__ArrayForEach(
                objectValues(nil, pluginAssets),
                function(____, range)
                    if range ~= nil then
                        do
                            local i = 0
                            while i < range.size do
                                provisionedIndice[#provisionedIndice + 1] = range.start + i
                                i = i + 1
                            end
                        end
                    end
                end
            )
        end
        for ____, instance in ipairs(objectValues(nil, pluginData.instances)) do
            local instanceAssets = instance.assets[poolId]
            if instanceAssets ~= nil then
                __TS__ArrayForEach(
                    objectValues(nil, instanceAssets),
                    function(____, range)
                        if range ~= nil then
                            do
                                local i = 0
                                while i < range.size do
                                    provisionedIndice[#provisionedIndice + 1] = range.start + i
                                    i = i + 1
                                end
                            end
                        end
                    end
                )
            end
        end
        return provisionedIndice
    end
    local function findAvailableRange(self, poolId, size)
        local provisionedIndice = getAllProvisionIds(nil, poolId)
        local found = false
        local subPool = subPoolRegistry:getPluginInternalSubPool(pu.pluginId, poolId)
        if subPool == nil then
            error(log:msg(("Could not find the internal sub-pool for " .. poolId) .. " pool in SubPoolRegistry "))
        end
        local poolRange = subPool.range
        local curStartIndex = subPool.range.start
        local curIndex = curStartIndex
        while not found and curIndex < poolRange.start + poolRange.size do
            if __TS__ArrayIncludes(provisionedIndice, curIndex) then
                curStartIndex = curIndex + 1
            else
                if curIndex - curStartIndex + 1 == size then
                    found = true
                end
            end
            curIndex = curIndex + 1
        end
        if found then
            return {start = curStartIndex, size = size}
        end
        return nil
    end
    local function getInstanceAssetManager(self, instanceId)
        local instanceData = pluginData.instances[instanceId]
        if instanceData == nil then
            error(("PluginAssetsManager : Instance " .. instanceId) .. " does not exist")
        end
        return AssetManager(
            nil,
            {
                assets = instanceData.assets,
                findAvailableRange = findAvailableRange,
                log = log:subLogger(("AssetManager(instance: " .. instanceId) .. ")"),
                of = of
            }
        )
    end
    local function getCommonAssetManager(self)
        local commonAssetsData = pluginData.pluginAssets
        return AssetManager(
            nil,
            {
                assets = commonAssetsData,
                findAvailableRange = findAvailableRange,
                log = log:subLogger("AssetManager(Common)"),
                of = of
            }
        )
    end
    local function deleteAll(self, undo)
        getCommonAssetManager(nil):deleteAll(undo)
        for ____, instanceId in ipairs(objectKeys(nil, pluginData.instances)) do
            getInstanceAssetManager(nil, instanceId):deleteAll(undo)
        end
    end
    return {getProvisionedPoolIds = getProvisionedPoolIds, getInstanceAssetManager = getInstanceAssetManager, getCommonAssetManager = getCommonAssetManager, deleteAll = deleteAll}
end
return ____exports
 end,
["lib.plugin.PluginEventHooks"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.PluginEventHooks(self, params)
    local ____params_0 = params
    local eventHandler = ____params_0.eventHandler
    local hookManager = ____params_0.hookManager
    return {
        hookPluginEvent = function(self, hookId, obj, callback, changeLevelFilter)
            hookManager:hook({
                hookId = hookId,
                obj = obj,
                onChange = function(obj, changeLevel)
                    if changeLevelFilter == nil or changeLevel == changeLevelFilter then
                        eventHandler:handlePluginEvent(
                            "PluginEventHook: " .. hookId,
                            function(____, context)
                                callback(nil, obj, context, changeLevel)
                            end
                        )
                    end
                end
            })
        end,
        hookInstanceEvent = function(self, hookId, instanceId, obj, callback, changeLevelFilter)
            hookManager:hook({
                hookId = hookId,
                obj = obj,
                onChange = function(obj, changeLevel)
                    if changeLevelFilter == nil or changeLevel == changeLevelFilter then
                        eventHandler:handleInstanceEvent(
                            (("InstanceEventHook: " .. instanceId) .. ":") .. hookId,
                            instanceId,
                            function(____, context)
                                callback(nil, obj, context, changeLevel)
                            end
                        )
                    end
                end
            })
        end
    }
end
return ____exports
 end,
["lib.plugin.PluginImageManager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____FileUtils = require("lib.FileUtils")
local FileUtils = ____FileUtils.FileUtils
local ____ImageLibraryAccess = require("lib.image.ImageLibraryAccess")
local ImageLibraryAccess = ____ImageLibraryAccess.ImageLibraryAccess
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local ASSET_TYPE_PREFIX = "__IMAGE_"
function ____exports.PluginImageManager(self, params)
    local log = params.log:subLogger("ImageManager")
    local imageAccess = ImageLibraryAccess(nil, params.pu.pluginId, log)
    local function getImageAssetType(self, imageKey)
        return ASSET_TYPE_PREFIX .. imageKey
    end
    local function installBuiltInImages(self)
        local ____params_0 = params
        local pluginData = ____params_0.pluginData
        local builtInImages = ____params_0.builtInImages
        local pu = ____params_0.pu
        if pluginData.builtInImagesInstalled == false then
            FileUtils:makeDir(imageAccess.imageLibraryPath)
            imageAccess:writeToImageLibrary(__TS__ArrayMap(
                objectKeys(nil, builtInImages),
                function(____, imageKey)
                    local imageData = builtInImages[imageKey]
                    return {sourceBase64 = imageData.imageBase64, fileName = imageData.fileName}
                end
            ))
            pluginData.builtInImagesInstalled = true
        end
    end
    local function isInternalImageSubPoolExists(self)
        local ____params_1 = params
        local pu = ____params_1.pu
        local subPoolRegistry = ____params_1.subPoolRegistry
        local imagesRange = subPoolRegistry:getPluginInternalSubPool(pu.pluginId, "Images")
        if imagesRange == nil then
            log:error("SubPoolRegistry has no images sub-pool associated with this plugin")
            return
        end
    end
    local function importAllImages(self)
        local ____params_2 = params
        local pluginAssetManager = ____params_2.pluginAssetManager
        local builtInImages = ____params_2.builtInImages
        isInternalImageSubPoolExists(nil)
        imageAccess:importImages(__TS__ArrayMap(
            objectKeys(nil, builtInImages),
            function(____, imagekey)
                local imageId = pluginAssetManager:provisionSingleAssetId(
                    getImageAssetType(nil, imagekey),
                    "Images"
                )
                local imageData = builtInImages[imagekey]
                return {imageFileName = imageData.fileName, targetIndex = imageId}
            end
        ))
    end
    local function importImage(self, imageKey, targetId)
        local ____params_3 = params
        local builtInImages = ____params_3.builtInImages
        isInternalImageSubPoolExists(nil)
        local imageData = builtInImages[imageKey]
        imageAccess:importImages({{imageFileName = imageData.fileName, targetIndex = targetId}})
    end
    local function getImageId(self, imageKey)
        local ____params_4 = params
        local pluginAssetManager = ____params_4.pluginAssetManager
        return pluginAssetManager:getSingleAssetId(
            getImageAssetType(nil, imageKey),
            "Images"
        )
    end
    local function uninstallImages(self)
        imageAccess:deleteAllImages()
    end
    return {
        imageLibraryPath = imageAccess.imageLibraryPath,
        uninstallImages = uninstallImages,
        installBuiltInImages = installBuiltInImages,
        importAllImages = importAllImages,
        importImage = importImage,
        getImageId = getImageId
    }
end
return ____exports
 end,
["lib.plugin.PluginInstanceManager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local findFirstAvailableNumber = ____Utils.findFirstAvailableNumber
local objectKeys = ____Utils.objectKeys
local objectNumOfItems = ____Utils.objectNumOfItems
function ____exports.PluginInstanceManager(self, pluginInstances, userInstances)
    local function setInstanceData(self, instanceId, data)
        userInstances[instanceId] = data
    end
    ---
    -- @returns a provisioned instance string id
    local function provisionNewInstance(self, data)
        local instanceIdNumber = findFirstAvailableNumber(
            nil,
            __TS__ArraySort(__TS__ArrayMap(
                objectKeys(nil, pluginInstances),
                function(____, key) return __TS__ParseInt(key) end
            ))
        )
        local instanceId = tostring(instanceIdNumber)
        pluginInstances[instanceId] = {assets = {}}
        userInstances[instanceId] = data
        return instanceId
    end
    ---
    -- @returns a provisioned instance string id
    local function loadUserInstance(self, instanceId, data)
        pluginInstances[instanceId] = {assets = {}}
        userInstances[instanceId] = data
        return instanceId
    end
    return {
        loadUserInstance = loadUserInstance,
        provisionNewInstance = provisionNewInstance,
        getNumOfInstances = function()
            return objectNumOfItems(nil, pluginInstances)
        end,
        getInstanceIds = function()
            return __TS__ArraySort(
                objectKeys(nil, pluginInstances),
                function(____, a, b) return __TS__ParseInt(a) - __TS__ParseInt(b) end
            )
        end,
        getInstanceData = function(____, instanceId)
            return userInstances[instanceId]
        end,
        setInstanceData = setInstanceData,
        deleteInstance = function(____, instanceId)
            if rawget(pluginInstances, instanceId) ~= nil then
                __TS__Delete(pluginInstances, instanceId)
            end
            if rawget(userInstances, instanceId) ~= nil then
                __TS__Delete(userInstances, instanceId)
            end
        end,
        deleteAll = function()
            for ____, instanceId in ipairs(objectKeys(nil, pluginInstances)) do
                if rawget(pluginInstances, instanceId) ~= nil then
                    __TS__Delete(pluginInstances, instanceId)
                end
            end
            for ____, instanceId in ipairs(objectKeys(nil, userInstances)) do
                if rawget(userInstances, instanceId) ~= nil then
                    __TS__Delete(userInstances, instanceId)
                end
            end
        end
    }
end
return ____exports
 end,
["lib.plugin.PluginMidiRemotes"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ObjectFactory = require("lib.ObjectFactory")
local ObjectFactory = ____ObjectFactory.ObjectFactory
____exports.PluginMidiRemotesReadOnly = __TS__Class()
local PluginMidiRemotesReadOnly = ____exports.PluginMidiRemotesReadOnly
PluginMidiRemotesReadOnly.name = "PluginMidiRemotesReadOnly"
function PluginMidiRemotesReadOnly.prototype.____constructor(self, pluginId, parentLog)
    self.pluginId = pluginId
    self.parentLog = parentLog
    self.log = parentLog:subLogger("PluginMidiRemotes")
end
function PluginMidiRemotesReadOnly.prototype.isMidiRemoteProvisioned(self)
    for ____, remote in ipairs(ObjectFactory.noContext:HMidiRemotes():getRemotes()) do
        if __TS__StringStartsWith(remote.name, self.pluginId) then
            return true
        end
    end
    return false
end
____exports.PluginMidiRemotes = __TS__Class()
local PluginMidiRemotes = ____exports.PluginMidiRemotes
PluginMidiRemotes.name = "PluginMidiRemotes"
__TS__ClassExtends(PluginMidiRemotes, ____exports.PluginMidiRemotesReadOnly)
function PluginMidiRemotes.prototype.____constructor(self, pluginId, parentLog)
    PluginMidiRemotes.____super.prototype.____constructor(self, pluginId, parentLog)
    self.pluginId = pluginId
    self.parentLog = parentLog
end
function PluginMidiRemotes.prototype.createRemoteName(self, instanceId, tag)
    return (((self.pluginId .. " I") .. instanceId) .. " ") .. tag
end
return ____exports
 end,
["lib.plugin.ContextBuilderBase"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____SubPoolRegistry = require("lib.plugins.SubPoolRegistry.index")
local SubPoolRegistry = ____SubPoolRegistry.SubPoolRegistry
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local typed = ____Utils.typed
local ____ObjectFactory = require("lib.ObjectFactory")
local ObjectFactory = ____ObjectFactory.ObjectFactory
local ____ExternalActionCommandFactory = require("lib.plugin.ExternalActionCommandFactory")
local ExternalActionCommandFactory = ____ExternalActionCommandFactory.ExternalActionCommandFactory
local ____PluginAssetManager = require("lib.plugin.PluginAssetManager")
local PluginAssetManager = ____PluginAssetManager.PluginAssetManager
local ____PluginEventHooks = require("lib.plugin.PluginEventHooks")
local PluginEventHooks = ____PluginEventHooks.PluginEventHooks
local ____PluginImageManager = require("lib.plugin.PluginImageManager")
local PluginImageManager = ____PluginImageManager.PluginImageManager
local ____PluginInstanceManager = require("lib.plugin.PluginInstanceManager")
local PluginInstanceManager = ____PluginInstanceManager.PluginInstanceManager
local ____PluginMidiRemotes = require("lib.plugin.PluginMidiRemotes")
local PluginMidiRemotes = ____PluginMidiRemotes.PluginMidiRemotes
local PluginMidiRemotesReadOnly = ____PluginMidiRemotes.PluginMidiRemotesReadOnly
____exports.ContextBuilderBase = __TS__Class()
local ContextBuilderBase = ____exports.ContextBuilderBase
ContextBuilderBase.name = "ContextBuilderBase"
function ContextBuilderBase.prototype.____constructor(self, params)
    self.params = params
end
function ContextBuilderBase.prototype.setEventHandler(self, eventHandler)
    self.eventHandler = eventHandler
end
function ContextBuilderBase.prototype.buildPluginContextReadOnly(self, pluginData, undo, subPoolRegistryData, log)
    local ____self_params_0 = self.params
    local pu = ____self_params_0.pu
    local builtInImages = ____self_params_0.builtInImages
    local runtime = ____self_params_0.runtime
    local ____pu_1 = pu
    local pluginId = ____pu_1.pluginId
    local pluginHandle = ____pu_1.pluginHandle
    local ____self_params_2 = self.params
    local enrichPluginContextReadOnly = ____self_params_2.enrichPluginContextReadOnly
    local displayHandle = ____self_params_2.displayHandle
    local of = __TS__New(
        ObjectFactory,
        {
            undoBlock = undo,
            hookManager = runtime:getHookManager(),
            log = log
        }
    )
    local subPoolRegistry = __TS__New(SubPoolRegistry, {
        eventEmitter = runtime.pluginRegistry.eventDispatcher,
        pluginId = pluginId,
        data = subPoolRegistryData,
        log = log,
        readOnly = true
    })
    local pam = PluginAssetManager(nil, {
        pluginData = pluginData,
        log = log,
        of = of,
        subPoolRegistry = subPoolRegistry,
        pu = pu
    })
    local imageManager = PluginImageManager(
        nil,
        {
            pluginData = pluginData,
            pluginAssetManager = pam:getCommonAssetManager(),
            builtInImages = builtInImages or ({}),
            pu = pu,
            subPoolRegistry = subPoolRegistry,
            log = log
        }
    )
    local instanceManager = PluginInstanceManager(nil, pluginData.instances, pluginData.userData.instances)
    local partialContext = self:doBuildPluginEventContextBaseReadOnly(typed(
        nil,
        {
            pluginData = pluginData,
            displayHandle = displayHandle,
            of = of,
            imageManager = imageManager,
            getInstanceIds = function() return instanceManager:getInstanceIds() end,
            log = log,
            mainAssetManager = pam,
            subPoolRegistry = subPoolRegistry,
            pu = pu,
            undo = undo,
            midiRemotes = __TS__New(PluginMidiRemotesReadOnly, pluginId, log)
        }
    ))
    return __TS__ObjectAssign(
        {},
        partialContext,
        {buildInstanceEventContextReadOnly = function(____, instanceId)
            return self:doBuildInstanceEventContextReadOnly(__TS__ObjectAssign(
                {},
                partialContext,
                {
                    instanceId = instanceId,
                    instanceAssetManager = partialContext.mainAssetManager:getInstanceAssetManager(instanceId)
                }
            ))
        end}
    )
end
function ContextBuilderBase.prototype.doBuildPluginEventContextBaseReadOnly(self, baseContext)
    local ____self_params_3 = self.params
    local enrichPluginContextReadOnly = ____self_params_3.enrichPluginContextReadOnly
    local ____temp_4
    if enrichPluginContextReadOnly == nil then
        ____temp_4 = baseContext
    else
        ____temp_4 = enrichPluginContextReadOnly(nil, baseContext)
    end
    return ____temp_4
end
function ContextBuilderBase.prototype.buildInstanceContextReadOnly(self, pluginData, instanceId, undo, subPoolRegistryData, log)
    local pluginContext = self:buildPluginContextReadOnly(pluginData, undo, subPoolRegistryData, log)
    local ____self_params_5 = self.params
    local enrichInstanceContextReadOnly = ____self_params_5.enrichInstanceContextReadOnly
    local displayHandle = ____self_params_5.displayHandle
    return self:doBuildInstanceEventContextReadOnly(__TS__ObjectAssign(
        {},
        pluginContext,
        {
            instanceId = instanceId,
            instanceAssetManager = pluginContext.mainAssetManager:getInstanceAssetManager(instanceId)
        }
    ))
end
function ContextBuilderBase.prototype.doBuildInstanceEventContextReadOnly(self, baseContext)
    local ____self_params_6 = self.params
    local enrichInstanceContextReadOnly = ____self_params_6.enrichInstanceContextReadOnly
    local ____temp_7
    if enrichInstanceContextReadOnly == nil then
        ____temp_7 = baseContext
    else
        ____temp_7 = enrichInstanceContextReadOnly(nil, baseContext)
    end
    return ____temp_7
end
function ContextBuilderBase.prototype.buildPluginContext(self, pluginData, undo, subPoolRegistryData, log)
    local ____self_params_8 = self.params
    local pu = ____self_params_8.pu
    local builtInImages = ____self_params_8.builtInImages
    local enrichPluginContext = ____self_params_8.enrichPluginContext
    local displayHandle = ____self_params_8.displayHandle
    local runtime = ____self_params_8.runtime
    local ____pu_9 = pu
    local pluginId = ____pu_9.pluginId
    local pluginInfo = ____pu_9.pluginInfo
    local eventHandler = self.eventHandler
    if eventHandler == nil then
        error(log:msg("eventHandler not initialized"))
    end
    local of = __TS__New(
        ObjectFactory,
        {
            undoBlock = undo,
            hookManager = runtime:getHookManager(),
            log = log
        }
    )
    local subPoolRegistry = __TS__New(SubPoolRegistry, {
        eventEmitter = runtime.pluginRegistry.eventDispatcher,
        pluginId = pluginId,
        data = subPoolRegistryData,
        log = log,
        readOnly = true
    })
    local pam = PluginAssetManager(nil, {
        pluginData = pluginData,
        log = log,
        of = of,
        subPoolRegistry = subPoolRegistry,
        pu = pu
    })
    local imageManager = PluginImageManager(
        nil,
        {
            pluginData = pluginData,
            pluginAssetManager = pam:getCommonAssetManager(),
            builtInImages = builtInImages or ({}),
            pu = pu,
            subPoolRegistry = subPoolRegistry,
            log = log
        }
    )
    local hooksManager = PluginEventHooks(
        nil,
        {
            eventHandler = eventHandler,
            hookManager = runtime:getHookManager()
        }
    )
    local instanceManager = PluginInstanceManager(nil, pluginData.instances, pluginData.userData.instances)
    local function buildInstanceContext(____, instanceId)
        return self:buildInstanceContext(
            pluginData,
            instanceId,
            undo,
            subPoolRegistryData,
            log
        )
    end
    local baseContext = {
        forEachInstance = function(self, fn)
            __TS__ArrayForEach(
                instanceManager:getInstanceIds(),
                function(____, instanceId) return fn(
                    nil,
                    buildInstanceContext(nil, instanceId)
                ) end
            )
        end,
        buildInstanceContext = buildInstanceContext,
        buildPluginContextReadOnly = function()
            local partialContext = self:doBuildPluginEventContextBaseReadOnly({
                pluginData = pluginData,
                displayHandle = displayHandle,
                of = of,
                imageManager = imageManager,
                getInstanceIds = function() return instanceManager:getInstanceIds() end,
                log = log,
                mainAssetManager = pam,
                subPoolRegistry = subPoolRegistry,
                pu = pu,
                undo = undo
            })
            return __TS__ObjectAssign(
                {},
                partialContext,
                {buildInstanceContextReadOnly = function(____, instanceId)
                    return self:doBuildInstanceEventContextReadOnly(__TS__ObjectAssign(
                        {},
                        partialContext,
                        {
                            instanceId = instanceId,
                            instanceAssetManager = partialContext.mainAssetManager:getInstanceAssetManager(instanceId)
                        }
                    ))
                end}
            )
        end,
        externalActionCommandFactory = ExternalActionCommandFactory(nil, pluginInfo, self.params.componentNumber),
        instanceManager = instanceManager,
        imageManager = imageManager,
        hooks = hooksManager,
        of = of,
        pluginData = pluginData,
        subPoolRegistry = __TS__New(SubPoolRegistry, {
            eventEmitter = runtime.pluginRegistry.eventDispatcher,
            pluginId = pluginId,
            data = subPoolRegistryData,
            log = log,
            readOnly = false
        }),
        mainAssetManager = pam,
        pluginRuntime = runtime,
        pu = pu,
        log = log,
        undo = undo,
        displayHandle = displayHandle
    }
    local ____temp_10
    if enrichPluginContext == nil then
        ____temp_10 = baseContext
    else
        ____temp_10 = enrichPluginContext(nil, baseContext)
    end
    return ____temp_10
end
function ContextBuilderBase.prototype.buildInstanceContext(self, pluginData, instanceId, undo, subPoolRegistryData, log)
    local ____self_params_11 = self.params
    local enrichInstanceContext = ____self_params_11.enrichInstanceContext
    local pluginContext = self:buildPluginContext(pluginData, undo, subPoolRegistryData, log)
    local baseContext = __TS__ObjectAssign(
        {},
        pluginContext,
        {
            buildInstanceEventContextReadOnly = function()
                return self:doBuildInstanceEventContextReadOnly(__TS__ObjectAssign(
                    {},
                    pluginContext:buildPluginContextReadOnly(),
                    {
                        instanceId = instanceId,
                        instanceAssetManager = pluginContext.mainAssetManager:getInstanceAssetManager(instanceId)
                    }
                ))
            end,
            commonAssetManager = pluginContext.mainAssetManager:getCommonAssetManager(),
            instanceAssetManager = pluginContext.mainAssetManager:getInstanceAssetManager(instanceId),
            instanceId = instanceId,
            numOfInstances = #objectKeys(nil, pluginData.userData.instances),
            midiRemotes = __TS__New(PluginMidiRemotes, pluginContext.pu.pluginId, log)
        }
    )
    return enrichInstanceContext(nil, baseContext)
end
return ____exports
 end,
["lib.plugin.EventProviders"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____CommandUtils = require("lib.CommandUtils")
local UndoBlock = ____CommandUtils.UndoBlock
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local objectValues = ____Utils.objectValues
--- REPORT BUG: When Undo is enabled, and I select 2 pools then do 2 undos, then MA crashes!
local UNDO_BLOCK_ENABLED = false
____exports.DataProvider = __TS__Class()
local DataProvider = ____exports.DataProvider
DataProvider.name = "DataProvider"
function DataProvider.prototype.____constructor(self, createDataAccess, log, options, postFinalize)
    self.createDataAccess = createDataAccess
    self.log = log
    self.options = options
    self.postFinalize = postFinalize
end
function DataProvider.prototype.prepare(self)
    self.dataAccess = self:createDataAccess()
    if not self.dataAccess:isCachedDataExists() and not self.dataAccess:read() then
        error((("Could not find MA variables data: variablesId=" .. self.dataAccess.variablesId) .. ", varName=") .. self.dataAccess.varName)
    end
end
function DataProvider.prototype.getValue(self)
    return self.dataAccess
end
function DataProvider.prototype.finalize(self)
    local dataAccess = self.dataAccess
    if dataAccess == nil then
        error(self.log:msg("finalize called without prepare"))
    end
    local wasWritten = false
    local ____table_options_readOnly_0 = self.options
    if ____table_options_readOnly_0 ~= nil then
        ____table_options_readOnly_0 = ____table_options_readOnly_0.readOnly
    end
    if ____table_options_readOnly_0 ~= true and dataAccess:isDirty() then
        dataAccess:write()
        wasWritten = true
    end
    if self.postFinalize ~= nil then
        self:postFinalize(wasWritten)
    end
end
____exports.UndoProvider = __TS__Class()
local UndoProvider = ____exports.UndoProvider
UndoProvider.name = "UndoProvider"
function UndoProvider.prototype.____constructor(self, undoName, options)
    self.undoName = undoName
    self.options = options
end
function UndoProvider.prototype.prepare(self)
    local ____UndoBlock_6 = UndoBlock
    local ____self_undoName_5 = self.undoName
    local ____table_options_undoBlockEnabled_2 = self.options
    if ____table_options_undoBlockEnabled_2 ~= nil then
        ____table_options_undoBlockEnabled_2 = ____table_options_undoBlockEnabled_2.undoBlockEnabled
    end
    local ____table_options_undoBlockEnabled_2_4 = ____table_options_undoBlockEnabled_2
    if ____table_options_undoBlockEnabled_2_4 == nil then
        ____table_options_undoBlockEnabled_2_4 = UNDO_BLOCK_ENABLED
    end
    self.undo = ____UndoBlock_6(nil, ____self_undoName_5, ____table_options_undoBlockEnabled_2_4)
end
function UndoProvider.prototype.getValue(self)
    return self.undo
end
function UndoProvider.prototype.finalize(self)
    local ____table_undo_close_result_7 = self.undo
    if ____table_undo_close_result_7 ~= nil then
        ____table_undo_close_result_7 = ____table_undo_close_result_7:close()
    end
end
function ____exports.MultiProvider(self, log, providers, common)
    return {
        prepare = function(self)
            __TS__ArrayForEach(
                objectKeys(nil, providers),
                function(____, pKey)
                    local provider = providers[pKey]
                    log:trace("prepare " .. pKey)
                    provider:prepare()
                end
            )
        end,
        getValue = function(self)
            return __TS__ArrayReduce(
                objectKeys(nil, providers),
                function(____, result, key)
                    result[key] = __TS__ObjectAssign(
                        {},
                        providers[key]:getValue(),
                        common
                    )
                    return result
                end,
                {}
            )
        end,
        finalize = function(self)
            __TS__ArrayForEach(
                objectValues(nil, providers),
                function(____, p) return p:finalize() end
            )
        end
    }
end
____exports.eventBuilder = function(____, eventName, pu, runtime, displayHandle, parentLog)
    local providers = {}
    local eventLog = parentLog:subLogger("E:" .. eventName)
    local b = {
        withData = function(self, options)
            local log = eventLog:subLogger("PluginData")
            providers.data = __TS__New(
                ____exports.DataProvider,
                function() return runtime.dataAccess end,
                log,
                options
            )
            return self
        end,
        withUndo = function(self, options)
            providers.undo = __TS__New(____exports.UndoProvider, eventName, options)
            return self
        end,
        withSubPoolRegistryData = function(self, options)
            local log = eventLog:subLogger("SubPoolRegistryData")
            providers.subPoolRegistryData = __TS__New(
                ____exports.DataProvider,
                function() return runtime.pluginRegistry:getOrInitSubPoolRegistryDataAccess() end,
                log,
                options,
                function(____, wasWritten)
                    if wasWritten then
                        log:trace("data CHANGED, dispatching event [subPoolsChange]")
                        runtime.pluginRegistry.eventDispatcher:emit({eventName = "subPoolsChange", displayHandle = displayHandle, pluginId = pu.pluginId})
                    end
                end
            )
            return self
        end,
        build = function(self)
            return {eventName = eventName, providers = providers, valuesStub = {}, log = eventLog}
        end
    }
    return b
end
return ____exports
 end,
["lib.plugin.InstanceRuntimeBase"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HookManager = require("lib.HookManager")
local HookManager = ____HookManager.HookManager
____exports.InstanceRuntimeBase = __TS__Class()
local InstanceRuntimeBase = ____exports.InstanceRuntimeBase
InstanceRuntimeBase.name = "InstanceRuntimeBase"
function InstanceRuntimeBase.prototype.____constructor(self, instanceId, pluginInfo, log, pluginRuntime)
    self.log = log:subLogger(("Instance(" .. instanceId) .. ")")
    self.__instanceHooksManager = HookManager(
        nil,
        {
            id = "instance_" .. instanceId,
            pluginHandle = pluginInfo.componentHandle:Parent(),
            parentLog = self.log,
            mutexFactory = pluginRuntime.mutexFactory
        }
    )
end
function InstanceRuntimeBase.prototype.getHookManager(self)
    return self.__instanceHooksManager
end
function InstanceRuntimeBase.prototype.cleanUp(self)
    self.__instanceHooksManager:cleanup()
end
return ____exports
 end,
["lib.AssertUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.AssertUtils = {assertNonEmpty = function(self, s, msgPrefix)
    assert(s ~= nil and #s > 0, msgPrefix .. ": Assert Non Empty String")
end}
return ____exports
 end,
["lib.ui.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.ui.InputFieldValidators"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local isInteger = ____Utils.isInteger
local function EXEC_ID(____, v)
    local parts = __TS__StringSplit(v, ".")
    if #parts ~= 2 then
        return {isValid = false, errorMsg = ("Invalid execId (" .. v) .. "). must have 2 parts separated by a dot.\n e.g 1.201"}
    end
    if not isInteger(nil, parts[1]) or not isInteger(nil, parts[2]) then
        return {isValid = false, errorMsg = ("Invalid execId (" .. v) .. "). parts must be numbers"}
    end
    return {isValid = true, errorMsg = ""}
end
local function POSITIVE_NUMBER(____, v)
    if not isInteger(nil, v) or __TS__ParseInt(v) < 1 then
        return {isValid = false, errorMsg = ("Invalid pool index (" .. v) .. "). index must be a positive integer number"}
    end
    return {isValid = true, errorMsg = ""}
end
local function POSITIVE_NUMBER_V2(____, v)
    if v < 1 then
        return {
            isValid = false,
            errorMsg = ("Invalid pool index (" .. tostring(v)) .. "). index must be a positive integer number"
        }
    end
    return {isValid = true, errorMsg = ""}
end
local function MIDI_INDEX_OR_VALUE(____, v)
    if not isInteger(nil, v) or __TS__ParseInt(v) < 0 or __TS__ParseInt(v) > 127 then
        return {isValid = false, errorMsg = ("Invalid pool index (" .. v) .. "). index must be a positive integer number"}
    end
    return {isValid = true, errorMsg = ""}
end
____exports.Validators = {EXEC_ID = EXEC_ID, POSITIVE_NUMBER = POSITIVE_NUMBER}
return ____exports
 end,
["lib.ui.MessageBoxHelperV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__ArrayFindIndex = ____lualib.__TS__ArrayFindIndex
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____InputFieldValidators = require("lib.ui.InputFieldValidators")
local Validators = ____InputFieldValidators.Validators
do
    local ____InputFieldValidators = require("lib.ui.InputFieldValidators")
    local Validators = ____InputFieldValidators.Validators
    ____exports.Validators = Validators
end
local function validateOptions(self, options)
    local inputLabels = {}
    if options.inputs ~= nil then
        __TS__ArrayForEach(
            options.inputs,
            function(____, inputOptions)
                if __TS__ArrayIncludes(inputLabels, inputOptions.label) then
                    return {isValidOptions = false, errorMsg = "duplicate labels are not allowed in inputs field"}
                end
                inputLabels[#inputLabels + 1] = inputOptions.label
            end
        )
    end
    return {isValidOptions = true, errorMsg = ""}
end
local function validateInputFields(self, mbInputs, resultInputs)
    for ____, inputOptions in ipairs(mbInputs) do
        local builtInValidateFn = nil
        repeat
            local ____switch9 = inputOptions.type
            local ____cond9 = ____switch9 == "POSITIVE_NUMBER"
            if ____cond9 then
                do
                    builtInValidateFn = Validators.POSITIVE_NUMBER
                    break
                end
            end
        until true
        local value = resultInputs[inputOptions.label]
        local function createMsg(____, msg)
            return (("Input Field [" .. inputOptions.label) .. "] is invalid:\n\n") .. msg
        end
        if builtInValidateFn ~= nil then
            local result = builtInValidateFn(nil, value)
            if not result.isValid then
                return {
                    isValid = false,
                    errorMsg = createMsg(nil, result.errorMsg)
                }
            end
        end
        if inputOptions.isValid ~= nil then
            local result = inputOptions:isValid(value)
            if not result.isValid then
                return {
                    isValid = false,
                    errorMsg = createMsg(nil, result.errorMsg)
                }
            end
        end
    end
    return {isValid = true, errorMsg = ""}
end
local function parseInputs(self, resultInputs, mbInputs)
    local inputs = {}
    for ____, inputOptions in ipairs(mbInputs) do
        local value = resultInputs[inputOptions.label]
        repeat
            local ____switch19 = inputOptions.type
            local ____cond19 = ____switch19 == "POSITIVE_NUMBER"
            if ____cond19 then
                do
                    inputs[inputOptions.id] = __TS__ParseInt(value)
                    break
                end
            end
            do
                do
                    inputs[inputOptions.id] = value
                end
            end
        until true
    end
    return inputs
end
local function convertStates(self, resultStates, mbStates)
    local states = {}
    for ____, stateOptions in ipairs(mbStates) do
        local stateValue = resultStates[stateOptions.label]
        states[stateOptions.id] = stateValue
    end
    return states
end
local function convertSelectors(self, resultSelectors, mbSelectors)
    local selectors = {}
    for ____, selectorOptions in ipairs(mbSelectors) do
        local selectedOptionIndex = resultSelectors[selectorOptions.label]
        local selectorOptionId = selectorOptions.options[selectedOptionIndex + 1].id
        selectors[selectorOptions.id] = selectorOptionId
    end
    return selectors
end
local function toMessageBoxInputOptions(self, mbInputs)
    return __TS__ArrayMap(
        mbInputs,
        function(____, inputOptions)
            local ____inputOptions_0 = inputOptions
            local id = ____inputOptions_0.id
            local label = ____inputOptions_0.label
            local isValid = ____inputOptions_0.isValid
            local ____type = ____inputOptions_0.type
            local originalInputProps = __TS__ObjectRest(____inputOptions_0, {id = true, label = true, isValid = true, type = true})
            local options = __TS__ObjectAssign({}, originalInputProps, ____type == "POSITIVE_NUMBER" and ({vkPlugin = "NumericInput"}) or ({}), {name = label})
            return options
        end
    )
end
local function toMessageBoxStatesOptions(self, mbStates)
    return __TS__ArrayMap(
        mbStates,
        function(____, state)
            local ____state_1 = state
            local id = ____state_1.id
            local label = ____state_1.label
            local originalStateProps = __TS__ObjectRest(____state_1, {id = true, label = true})
            local options = __TS__ObjectAssign({}, originalStateProps, {name = label})
            return options
        end
    )
end
local function toMessageBoxSelectorsOptions(self, mbSelectors)
    return __TS__ArrayMap(
        mbSelectors,
        function(____, selector)
            local ____selector_2 = selector
            local id = ____selector_2.id
            local label = ____selector_2.label
            local selectedOptionId = ____selector_2.selectedOptionId
            local options = ____selector_2.options
            local originalStateProps = __TS__ObjectRest(____selector_2, {id = true, label = true, selectedOptionId = true, options = true})
            local values = __TS__ArrayReduce(
                options,
                function(____, res, option, index)
                    res[option.label] = index
                    return res
                end,
                {}
            )
            local selectedValue = __TS__ArrayFindIndex(
                options,
                function(____, o) return o.id == selectedOptionId end
            )
            local mbSelectorOptions = __TS__ObjectAssign({}, originalStateProps, {name = label, values = values, selectedValue = selectedValue})
            return mbSelectorOptions
        end
    )
end
local function mergeOptionsFromResult(self, srcOptions, mbOptions, mbData, errorMsg)
    local mbInputs = mbOptions.inputs
    local ____temp_4
    if mbInputs == nil then
        ____temp_4 = nil
    else
        ____temp_4 = __TS__ArrayMap(
            mbInputs,
            function(____, inputOptions)
                local ____inputOptions_3 = inputOptions
                local value = ____inputOptions_3.value
                local label = ____inputOptions_3.label
                local isValid = ____inputOptions_3.isValid
                local ____type = ____inputOptions_3.type
                local originalInputProps = __TS__ObjectRest(____inputOptions_3, {value = true, label = true, isValid = true, type = true})
                local newValue = mbData.inputs[inputOptions.id]
                local options = __TS__ObjectAssign(
                    {},
                    originalInputProps,
                    ____type == "POSITIVE_NUMBER" and ({vkPlugin = "NumericInput"}) or ({}),
                    {
                        name = label,
                        value = type(newValue) == "number" and (__TS__NumberIsNaN(__TS__Number(newValue)) and "" or tostring(newValue)) or newValue
                    }
                )
                return options
            end
        )
    end
    local newInputs = ____temp_4
    local mbStates = mbOptions.states
    local ____temp_6
    if mbStates == nil then
        ____temp_6 = nil
    else
        ____temp_6 = __TS__ArrayMap(
            mbStates,
            function(____, stateOptions)
                local ____stateOptions_5 = stateOptions
                local state = ____stateOptions_5.state
                local label = ____stateOptions_5.label
                local originalInputProps = __TS__ObjectRest(____stateOptions_5, {state = true, label = true})
                local newValue = mbData.states[stateOptions.id]
                local options = __TS__ObjectAssign({}, originalInputProps, {name = label, state = newValue})
                return options
            end
        )
    end
    local newStates = ____temp_6
    local mbSelectors = mbOptions.selectors
    local newSelectors = nil
    if mbSelectors ~= nil then
        newSelectors = toMessageBoxSelectorsOptions(nil, mbSelectors)
        __TS__ArrayForEach(
            newSelectors,
            function(____, selector, index)
                local selectedOptionId = mbData.selectors[mbSelectors[index + 1].id]
                selector.selectedValue = __TS__ArrayFindIndex(
                    mbSelectors[index + 1].options,
                    function(____, o) return o.id == selectedOptionId end
                )
            end
        )
    end
    return __TS__ObjectAssign({}, srcOptions, {
        inputs = newInputs,
        states = newStates,
        selectors = newSelectors,
        message = errorMsg,
        backColor = "Global.AlertText"
    })
end
function ____exports.showMessageBox(self, options)
    local ____options_7 = options
    local mbCommands = ____options_7.commands
    local mbInputs = ____options_7.inputs
    local mbStates = ____options_7.states
    local mbSelectors = ____options_7.selectors
    local onUserAbort = ____options_7.onUserAbort
    local validateData = ____options_7.validateData
    local partialOriginalOptions = __TS__ObjectRest(____options_7, {
        commands = true,
        inputs = true,
        states = true,
        selectors = true,
        onUserAbort = true,
        validateData = true
    })
    local ____validateOptions_result_8 = validateOptions(nil, options)
    local isValidOptions = ____validateOptions_result_8.isValidOptions
    local errorMsg = ____validateOptions_result_8.errorMsg
    if not isValidOptions then
        error("MessageBoxHelper: invalid options: " .. errorMsg)
    end
    local commands = __TS__ArrayMap(
        mbCommands,
        function(____, cmd, index)
            return {name = cmd.label, value = index}
        end
    )
    local ____temp_9
    if mbInputs == nil then
        ____temp_9 = nil
    else
        ____temp_9 = toMessageBoxInputOptions(nil, mbInputs)
    end
    local initialInputs = ____temp_9
    local ____temp_10
    if mbStates == nil then
        ____temp_10 = nil
    else
        ____temp_10 = toMessageBoxStatesOptions(nil, mbStates)
    end
    local initialStates = ____temp_10
    local ____temp_11
    if mbSelectors == nil then
        ____temp_11 = nil
    else
        ____temp_11 = toMessageBoxSelectorsOptions(nil, mbSelectors)
    end
    local initialSelectors = ____temp_11
    local messageBoxOptions = __TS__ObjectAssign(
        {},
        partialOriginalOptions,
        {commands = commands},
        initialInputs == nil and ({}) or ({inputs = initialInputs}),
        initialStates == nil and ({}) or ({states = initialStates}),
        initialSelectors == nil and ({}) or ({selectors = initialSelectors})
    )
    local isValid = true
    repeat
        do
            local mbResult = MessageBox(__TS__ObjectAssign({}, messageBoxOptions))
            local success = mbResult.success
            local commandIndex = mbResult.result
            local resultInputs = mbResult.inputs
            local resultSelectors = mbResult.selectors
            local resultStates = mbResult.states
            if not success then
                local ____temp_12
                if onUserAbort == nil then
                    ____temp_12 = nil
                else
                    ____temp_12 = onUserAbort(nil)
                end
                return ____temp_12
            else
                local command = mbCommands[(commandIndex == -1 and 0 or commandIndex) + 1]
                if command.type ~= nil and command.type == "abort" then
                    return command:action()
                else
                    local messageBoxData = {
                        inputs = mbInputs == nil and ({}) or parseInputs(nil, resultInputs, mbInputs),
                        states = mbStates == nil and ({}) or convertStates(nil, resultStates, mbStates),
                        selectors = mbSelectors == nil and ({}) or convertSelectors(nil, resultSelectors, mbSelectors)
                    }
                    local errorMsg = ""
                    if mbInputs ~= nil then
                        local ____validateInputFields_result_13 = validateInputFields(nil, mbInputs, resultInputs)
                        local _isValid = ____validateInputFields_result_13.isValid
                        local _errorMsg = ____validateInputFields_result_13.errorMsg
                        isValid = _isValid
                        errorMsg = _errorMsg
                    end
                    if isValid and validateData ~= nil then
                        local result = validateData(nil, messageBoxData)
                        isValid = result.isValid
                        errorMsg = result.isValid and errorMsg or result.errorMsg
                    end
                    if isValid then
                        return command:action(messageBoxData)
                    else
                        messageBoxOptions = mergeOptionsFromResult(
                            nil,
                            messageBoxOptions,
                            options,
                            messageBoxData,
                            errorMsg
                        )
                    end
                end
            end
        end
    until isValid
end
return ____exports
 end,
["lib.ui.Alert"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MessageBoxHelperV2 = require("lib.ui.MessageBoxHelperV2")
local showMessageBox = ____MessageBoxHelperV2.showMessageBox
function ____exports.showAlert(self, screenNumber, title, message)
    local mbOptions = {
        title = title,
        message = message,
        display = screenNumber,
        commands = {{
            label = "Ok",
            action = function(____, data)
            end
        }}
    }
    return showMessageBox(nil, mbOptions)
end
return ____exports
 end,
["lib.ui.OldStartUI"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local nTimes = ____Utils.nTimes
function ____exports.startUI(self, displayHandle, initialDialog)
    local dialogStack = {initialDialog}
    while #dialogStack > 0 do
        local uiAction = dialogStack[#dialogStack]:show(displayHandle)
        repeat
            local ____switch4 = uiAction.type
            local ____cond4 = ____switch4 == "Quit"
            if ____cond4 then
                do
                    dialogStack = {}
                    return uiAction.returnValue
                end
            end
            ____cond4 = ____cond4 or ____switch4 == "PushDialog"
            if ____cond4 then
                do
                    dialogStack[#dialogStack + 1] = uiAction.dialog
                    break
                end
            end
            ____cond4 = ____cond4 or ____switch4 == "PopDialog"
            if ____cond4 then
                do
                    nTimes(
                        nil,
                        uiAction.numOfDialogsToPop or 1,
                        function()
                            table.remove(dialogStack)
                        end
                    )
                    if #dialogStack == 0 then
                        return uiAction.returnValue
                    end
                    break
                end
            end
            ____cond4 = ____cond4 or ____switch4 == "ReplaceDialog"
            if ____cond4 then
                do
                    table.remove(dialogStack)
                    dialogStack[#dialogStack + 1] = uiAction.dialog
                    break
                end
            end
            ____cond4 = ____cond4 or ____switch4 == "RefreshDialog"
            if ____cond4 then
                do
                    break
                end
            end
        until true
    end
    error("startUI: dialogStack empty")
end
return ____exports
 end,
["lib.ui.PopupInputHelper"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.showPopupInput(self, options)
    local ____options_0 = options
    local actions = ____options_0.actions
    local selectedIndex = ____options_0.selectedIndex
    local popupInputOptions = __TS__ObjectRest(____options_0, {actions = true, selectedIndex = true})
    local items = __TS__ArrayMap(
        actions,
        function(____, a) return a.label end
    )
    assert(#items > 0, "showPopupInput(): items array must not be empty")
    local index, _label = PopupInput(__TS__ObjectAssign({}, popupInputOptions, {items = items, selectedValue = items[selectedIndex + 1]}))
    if index ~= nil then
        return options.actions[index + 1]:action()
    end
end
return ____exports
 end,
["lib.ui.UIColors"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ColorGroups = Root().ColorTheme.ColorGroups
____exports.CGGlobal = ColorGroups.Global
____exports.CGDisplay = ColorGroups.Display
____exports.UIColors = {
    Global = Root().ColorTheme.ColorDefCollect.Global,
    Text = ____exports.CGGlobal.Text,
    DisabledText = ____exports.CGGlobal.LabelText,
    AlertText = ____exports.CGGlobal.AlertText,
    LabelBG = ____exports.CGGlobal.BackgroundSelectedInverted,
    ColorGroupsGlobal = ____exports.CGGlobal,
    FrameColor = ____exports.CGDisplay.FrameColor,
    Background = ____exports.CGGlobal.Background,
    BackgroundSelected = ____exports.CGGlobal.BackgroundSelected,
    BackgroundSelectedInverted = ____exports.CGGlobal.BackgroundSelectedInverted,
    Default = ____exports.CGGlobal.Default,
    Darkened = ____exports.CGGlobal.Darkened,
    Transparent = ____exports.CGGlobal.Transparent,
    Transparent25 = ____exports.CGGlobal.Transparent25,
    Transparent50 = ____exports.CGGlobal.Transparent50,
    Transparent75 = ____exports.CGGlobal.Transparent75,
    Disabled = ____exports.CGGlobal.Disabled,
    LabelText = ____exports.CGGlobal.LabelText,
    Lightened = ____exports.CGGlobal.Lightened,
    Selected = ____exports.CGGlobal.Selected,
    PartlySelected = ____exports.CGGlobal.PartlySelected
}
return ____exports
 end,
["lib.ui.UIDebugUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local printAnchors, ____print
local ____StringUtils = require("lib.StringUtils")
local StringUtils = ____StringUtils.StringUtils
function printAnchors(self, a)
    return type(a) == "string" and a or ((((((("tb[" .. tostring(a.top)) .. ",") .. tostring(a.bottom)) .. "]lr[") .. tostring(a.left)) .. ",") .. tostring(a.right)) .. "]"
end
function ____print(self, obj, prefix)
    local s = ""
    local function printCommon(self)
        local o = obj
        return ((((o.w == nil and "" or (prefix .. "w: ") .. tostring(o.w)) .. "\n") .. (o.h == nil and "" or (prefix .. "h: ") .. tostring(o.h))) .. "\n") .. (o.anchors == nil and "" or (prefix .. "anchors: ") .. printAnchors(nil, o.anchors))
    end
    repeat
        local ____switch12 = obj:GetClass()
        local ____cond12 = ____switch12 == "Popup"
        if ____cond12 then
            do
                s = s .. printCommon(nil)
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "UIObject"
        if ____cond12 then
            do
                s = s .. printCommon(nil)
                s = s .. (prefix .. "alignmentH: ") .. tostring(obj.alignmentH)
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "Item"
        if ____cond12 then
            do
                local item = obj
                s = s .. ((("[" .. item.sizePolicy) .. ",") .. tostring(item.size)) .. "]"
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "LineEdit"
        if ____cond12 then
            do
                local item = obj
                s = s .. "\n" .. printCommon(nil)
                s = s .. (prefix .. "text: ") .. tostring(obj.text)
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "Button"
        if ____cond12 then
            do
                local button = obj
                s = s .. "\n" .. printCommon(nil)
                s = s .. ((("\n" .. prefix) .. "text: ") .. button.text) .. "\n"
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "UILayoutGrid"
        if ____cond12 then
            do
                local grid = obj
                s = s .. printCommon(nil)
                break
            end
        end
        do
            do
                s = s .. ""
            end
        end
    until true
    return s
end
local INDENT = "  "
function ____exports.dump(self, obj, indent, multiline)
    if indent == nil then
        indent = 0
    end
    if multiline == nil then
        multiline = true
    end
    local s = ""
    s = s .. obj.name .. " - "
    local keyPrefix2 = StringUtils["repeat"](StringUtils, INDENT, indent + 2)
    local function printProps(self, obj)
        s = s .. ____print(nil, obj, keyPrefix2) .. "\n"
    end
    local function printIf(self, propName)
        if obj[propName] ~= nil then
            s = s .. (((keyPrefix2 .. propName) .. ": ") .. tostring(obj[propName])) .. "\n"
        end
    end
    local count = obj:Count()
    if count == 0 then
        printProps(nil, obj)
    else
        s = s .. "\n"
        printProps(nil, obj)
        local children = obj:Children()
        do
            local i = 0
            while i < #children do
                local child = children[i + 1]
                s = s .. ((keyPrefix2 .. tostring(i + 1)) .. ":") .. ____exports.dump(nil, child, indent + 1)
                i = i + 1
            end
        end
    end
    return s
end
____exports.UIDebugUtils = {dump = ____exports.dump}
return ____exports
 end,
["lib.ui.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____Alert = require("lib.ui.Alert")
    local showAlert = ____Alert.showAlert
    ____exports.showAlert = showAlert
end
do
    local ____MessageBoxHelperV2 = require("lib.ui.MessageBoxHelperV2")
    local showMessageBox = ____MessageBoxHelperV2.showMessageBox
    ____exports.showMessageBox = showMessageBox
end
do
    local ____OldStartUI = require("lib.ui.OldStartUI")
    local startUI = ____OldStartUI.startUI
    ____exports.startUI = startUI
end
do
    local ____PopupInputHelper = require("lib.ui.PopupInputHelper")
    local showPopupInput = ____PopupInputHelper.showPopupInput
    ____exports.showPopupInput = showPopupInput
end
do
    local ____UIColors = require("lib.ui.UIColors")
    local ColorGroupsGlobal = ____UIColors.CGGlobal
    local UIColors = ____UIColors.UIColors
    ____exports.ColorGroupsGlobal = ColorGroupsGlobal
    ____exports.UIColors = UIColors
end
do
    local ____UIDebugUtils = require("lib.ui.UIDebugUtils")
    local UIDebugUtils = ____UIDebugUtils.UIDebugUtils
    ____exports.UIDebugUtils = UIDebugUtils
end
return ____exports
 end,
["lib.plugin.PluginSignals"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.PluginSignals = __TS__Class()
local PluginSignals = ____exports.PluginSignals
PluginSignals.name = "PluginSignals"
function PluginSignals.prototype.____constructor(self, pluginInfo, parentLog)
    self.pluginInfo = pluginInfo
    self.parentLog = parentLog
    self.log = parentLog:subLogger("PluginSignals")
end
function PluginSignals.prototype.registerHandler(self, signalId, callback)
    local signalTable = self.pluginInfo.signalTable
    signalTable[signalId] = callback
end
function PluginSignals.prototype.unregisterHandler(self, signalId)
    local signalTable = self.pluginInfo.signalTable
    __TS__Delete(signalTable, signalId)
end
return ____exports
 end,
["lib.ui.components.UIBaseComponent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.ui.components.HActionList"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local applyObjPropsWithDefaults = ____Utils.applyObjPropsWithDefaults
local DEFAULT_OPTIONS = {}
____exports.DEFAULT_ACTION_HEIGHT = 100
____exports.HActionList = __TS__Class()
local HActionList = ____exports.HActionList
HActionList.name = "HActionList"
function HActionList.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
end
function HActionList.prototype.render(self, renderContext)
    local ____self_options_0 = self.options
    local _actionHeight = ____self_options_0.actionHeight
    local items = ____self_options_0.actions
    local id = ____self_options_0.id
    local textAlignmentH = ____self_options_0.textAlignmentH
    local direction = ____self_options_0.direction
    local actionHeight = _actionHeight == nil and ____exports.DEFAULT_ACTION_HEIGHT or _actionHeight
    local optionsWithDefaults = __TS__ObjectAssign(self.options, DEFAULT_OPTIONS)
    local grid = self.context.f:HUnidirectionalGrid(__TS__ObjectAssign(
        {},
        optionsWithDefaults,
        {
            direction = direction,
            children = __TS__ArrayMap(
                items,
                function(____, item, index)
                    return {
                        comp = self.context.f:UIButton({
                            id = (id .. "__option_") .. tostring(index),
                            label = item.label,
                            signals = {clicked = function(____, caller)
                                item:action()
                            end}
                        }),
                        item = direction == "Vertical" and ({sizePolicy = "Fixed", size = actionHeight}) or ({sizePolicy = "Stretch", size = 1})
                    }
                end
            ),
            visitChild = function(____, child, index)
                local button = child
                applyObjPropsWithDefaults(nil, button, {}, {textAlignmentH = textAlignmentH})
            end
        }
    )):render(renderContext)
    return grid
end
return ____exports
 end,
["lib.ui.components.HHorizontalGrid"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HUnidirectionalGrid = require("lib.ui.components.HUnidirectionalGrid")
local HUnidirectionalGrid = ____HUnidirectionalGrid.HUnidirectionalGrid
____exports.HHorizontalGrid = __TS__Class()
local HHorizontalGrid = ____exports.HHorizontalGrid
HHorizontalGrid.name = "HHorizontalGrid"
function HHorizontalGrid.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
end
function HHorizontalGrid.prototype.render(self, renderContext)
    return __TS__New(
        HUnidirectionalGrid,
        __TS__ObjectAssign({}, self.options, {direction = "Horizontal"}),
        self.context
    ):render(renderContext)
end
return ____exports
 end,
["lib.ui.components.ma.common"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
function ____exports.applyUIObjectProps(self, obj, props)
    if props.anchors ~= nil then
        obj.anchors = props.anchors
    end
    if props.w ~= nil then
        obj.w = props.w
    end
    if props.h ~= nil then
        obj.h = props.h
    end
end
function ____exports.renderObjectSignals(self, id, obj, signals, context)
    for ____, key in ipairs(objectKeys(nil, signals)) do
        local callbackFn = signals[key]
        local signalId = (id .. "_") .. key
        context.pluginSignals:registerHandler(
            signalId,
            function(____, caller)
                callbackFn(nil, caller)
            end
        )
        obj[key] = ":" .. signalId
    end
end
return ____exports
 end,
["lib.ui.components.ma.MAButton"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local applyObjProps = ____Utils.applyObjProps
local applyObjPropsWithDefaults = ____Utils.applyObjPropsWithDefaults
local ____common = require("lib.ui.components.ma.common")
local renderObjectSignals = ____common.renderObjectSignals
local DEFAULT_PROPS = {
    textShadow = 0,
    padding = {left = 10, right = 10, top = 10, bottom = 10},
    focus = "CanHaveFocus",
    hasHover = "Yes",
    font = "Regular24",
    textAlignmentH = "Center"
}
____exports.MAButton = __TS__Class()
local MAButton = ____exports.MAButton
MAButton.name = "MAButton"
function MAButton.prototype.____constructor(self, options, context)
    self.context = context
    self.options = options
end
function MAButton.prototype.updateProps(self, props)
    applyObjProps(nil, self.button, props)
end
function MAButton.prototype.render(self, params)
    local ____params_0 = params
    local parent = ____params_0.parent
    local button = parent:Append("Button")
    self.button = button
    self:doUpdate(button, self.options)
    return button
end
function MAButton.prototype.update(self, options)
    if self.button == nil then
        error("update called befire render")
    end
    applyObjProps(nil, self.options, options)
    self:doUpdate(self.button, self.options)
end
function MAButton.prototype.doUpdate(self, button, options)
    local ____options_1 = options
    local signals = ____options_1.signals
    local id = ____options_1.id
    local label = ____options_1.label
    local icon = ____options_1.icon
    local props = ____options_1.props
    renderObjectSignals(
        nil,
        id,
        button,
        signals,
        self.context
    )
    applyObjPropsWithDefaults(
        nil,
        button,
        DEFAULT_PROPS,
        __TS__ObjectAssign(
            {},
            props == nil and ({}) or props,
            {pluginComponent = self.context.pluginInfo.componentHandle},
            label == nil and ({text = ""}) or ({text = label}),
            icon == nil and ({icon = ""}) or ({icon = icon})
        )
    )
end
function MAButton.prototype.cleanup(self)
end
return ____exports
 end,
["lib.ui.components.HSelectionGridTypes"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.ui.components.HInputFieldGridTypes"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.HELP_ICON_WIDTH = 50
return ____exports
 end,
["lib.ui.components.HInputFieldGrid"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local ColorGroupsGlobal = ____ui.ColorGroupsGlobal
local UIColors = ____ui.UIColors
local ____HInputFieldGridTypes = require("lib.ui.components.HInputFieldGridTypes")
local HELP_ICON_WIDTH = ____HInputFieldGridTypes.HELP_ICON_WIDTH
local DEFAULT_OPTIONS = {w = "100%", h = "100%"}
____exports.HInputFieldGrid = __TS__Class()
local HInputFieldGrid = ____exports.HInputFieldGrid
HInputFieldGrid.name = "HInputFieldGrid"
function HInputFieldGrid.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
    self.log = self.context.log
end
function HInputFieldGrid.prototype.render(self, renderContext)
    self.log:trace("HInputFieldGrid.render()")
    local ____self_options_0 = self.options
    local labelColumnSize = ____self_options_0.labelColumnSize
    local valueColumnSize = ____self_options_0.valueColumnSize
    local rowSize = ____self_options_0.rowSize
    local inputFields = ____self_options_0.inputFields
    local data = ____self_options_0.data
    local textAlignmentH = ____self_options_0.textAlignmentH
    local optionsRest = __TS__ObjectRest(____self_options_0, {
        labelColumnSize = true,
        valueColumnSize = true,
        rowSize = true,
        inputFields = true,
        data = true,
        textAlignmentH = true
    })
    local optionsWithDefaults = __TS__ObjectAssign(optionsRest, DEFAULT_OPTIONS)
    local children = __TS__ArrayMap(
        inputFields,
        function(____, field)
            local ____field_1 = field
            local helpAction = ____field_1.helpAction
            local id = ____field_1.id
            local labelComp = self.context.f:UIText({text = field.label, backColor = ColorGroupsGlobal.BackgroundSelectedInverted, textAlignmentH = textAlignmentH})
            local ____self_3 = self.context.f
            local ____self_3_HHorizontalGrid_4 = ____self_3.HHorizontalGrid
            local ____array_2 = __TS__SparseArrayNew(table.unpack(helpAction == nil and ({{comp = labelComp, item = labelColumnSize}}) or ({{
                comp = self.context.f:HHorizontalGrid({children = {
                    {comp = labelComp, item = {sizePolicy = "Stretch", size = 1}},
                    {
                        comp = self.context.f:UIButton({
                            id = id,
                            label = "",
                            icon = "QuestionMarkIcon",
                            props = {backColor = UIColors.BackgroundSelectedInverted, w = 50, h = 50},
                            signals = {clicked = function()
                                helpAction(nil)
                            end}
                        }),
                        item = {sizePolicy = "Fixed", size = HELP_ICON_WIDTH}
                    }
                }}),
                item = labelColumnSize
            }})))
            __TS__SparseArrayPush(
                ____array_2,
                {
                    comp = field.fieldType == "input" and self:createInput(field, data) or (field.fieldType == "selection" and self:createSelection(field, data) or self:createBoolean(field, data)),
                    item = {sizePolicy = "Stretch", size = 1}
                }
            )
            local row = ____self_3_HHorizontalGrid_4(
                ____self_3,
                {children = {__TS__SparseArraySpread(____array_2)}}
            )
            return {comp = row, item = rowSize}
        end
    )
    local grid = self.context.f:HVerticalGrid(__TS__ObjectAssign({}, optionsWithDefaults, {children = children}))
    return grid:render(renderContext)
end
function HInputFieldGrid.prototype.createInput(self, field, data)
    local inputFieldId = field.id
    return self.context.f:UIInputBox(__TS__ObjectAssign(
        {id = inputFieldId, type = field.type},
        field.type == "POSITIVE_NUMBER" and field.range ~= nil and ({range = field.range}) or ({}),
        {
            label = field.label,
            value = data[inputFieldId],
            props = {},
            onChange = function(____, value)
                if field.onChange ~= nil then
                    field:onChange(value)
                end
            end
        }
    ))
end
function HInputFieldGrid.prototype.createSelection(self, field, data)
    local ____field_5 = field
    local items = ____field_5.items
    return self.context.f:HSelectionGrid({
        id = field.id,
        direction = "Horizontal",
        items = items,
        selectedItemId = data[field.id],
        onSelectionChange = function(____, itemId)
            data[field.id] = itemId
            if field.onChange ~= nil then
                field:onChange(data[field.id])
            end
        end
    })
end
function HInputFieldGrid.prototype.createBoolean(self, field, data)
    local ____field_6 = field
    local stateLabels = ____field_6.stateLabels
    return self.context.f:HSelectionGrid({
        id = field.id,
        direction = "Horizontal",
        items = stateLabels == nil and ({{id = "false", label = "No"}, {id = "true", label = "Yes"}}) or ({{id = "false", label = stateLabels.falseState}, {id = "true", label = stateLabels.trueState}}),
        selectedItemId = data[field.id] == true and "true" or "false",
        onSelectionChange = function(____, selectedId)
            local value = selectedId == "true"
            data[field.id] = value
            if field.onChange ~= nil then
                field:onChange(value)
            end
        end
    })
end
return ____exports
 end,
["lib.ui.components.ma.MAUILayoutGrid"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____common = require("lib.ui.components.ma.common")
local applyUIObjectProps = ____common.applyUIObjectProps
____exports.MAUILayoutGrid = __TS__Class()
local MAUILayoutGrid = ____exports.MAUILayoutGrid
MAUILayoutGrid.name = "MAUILayoutGrid"
function MAUILayoutGrid.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
    self.children = {}
end
function MAUILayoutGrid.prototype.setChildren(self, children)
    self.children = children
    return self
end
function MAUILayoutGrid.prototype.render(self, renderContext)
    local ____renderContext_0 = renderContext
    local parent = ____renderContext_0.parent
    local clazz = self.options.clazz == nil and "UILayoutGrid" or self.options.clazz
    local uiLayoutGrid = parent:Append(clazz)
    self:applyProps(uiLayoutGrid)
    do
        local i = 0
        while i < #self.children do
            local child = self.children[i + 1]
            local obj = child:render({parent = uiLayoutGrid})
            if self.options.visitChild ~= nil then
                self.options:visitChild(obj, i)
            end
            i = i + 1
        end
    end
    return uiLayoutGrid
end
function MAUILayoutGrid.prototype.applyProps(self, obj)
    local ____self_options_1 = self.options
    local rows = ____self_options_1.rows
    local columns = ____self_options_1.columns
    obj.columns = #columns
    obj.rows = #rows
    local rowsCollect = obj[1]
    local colsCollect = obj[2]
    do
        local i = 0
        while i < #rows do
            local item = rowsCollect:Children()[i + 1]
            item.sizePolicy = rows[i + 1].sizePolicy
            local size = rows[i + 1].size
            if size ~= nil then
                item.size = size
            end
            i = i + 1
        end
    end
    do
        local j = 0
        while j < #columns do
            local item = colsCollect:Children()[j + 1]
            item.sizePolicy = columns[j + 1].sizePolicy
            local size = columns[j + 1].size
            if size ~= nil then
                item.size = size
            end
            j = j + 1
        end
    end
    applyUIObjectProps(nil, obj, self.options)
end
return ____exports
 end,
["lib.ui.components.ma.MADialogFrame"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local applyObjProps = ____Utils.applyObjProps
local ____MAUILayoutGrid = require("lib.ui.components.ma.MAUILayoutGrid")
local MAUILayoutGrid = ____MAUILayoutGrid.MAUILayoutGrid
____exports.MADialogFrame = __TS__Class()
local MADialogFrame = ____exports.MADialogFrame
MADialogFrame.name = "MADialogFrame"
function MADialogFrame.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
end
function MADialogFrame.prototype.setContent(self, component)
    self.content = component
end
function MADialogFrame.prototype.render(self, params)
    self.context.log:trace("UIDialogFrame.render()")
    local uiLayoutGrid = __TS__New(
        MAUILayoutGrid,
        {
            clazz = "DialogFrame",
            rows = {{sizePolicy = "Content"}},
            columns = {{sizePolicy = "Stretch", size = 1}},
            anchors = {top = 0, bottom = 0, left = 0, right = 0},
            visitChild = function(____, child, index)
                child.anchors = {top = 0, bottom = 0, right = 0, left = 0}
            end
        },
        self.context
    )
    if self.content ~= nil then
        uiLayoutGrid:setChildren({self.content})
    end
    local obj = uiLayoutGrid:render(params)
    self:applyProps(obj)
    return obj
end
function MADialogFrame.prototype.applyProps(self, obj)
    applyObjProps(nil, obj, {h = "100%", w = "100%", anchors = {left = 0, right = 0, top = 1, bottom = 1}})
end
return ____exports
 end,
["lib.ui.components.ma.MALineEdit"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local applyObjPropsWithDefaults = ____Utils.applyObjPropsWithDefaults
local ____common = require("lib.ui.components.ma.common")
local renderObjectSignals = ____common.renderObjectSignals
local DEFALUT_PROPS = {
    textShadow = 1,
    padding = {left = 10, right = 10, top = 10, bottom = 10},
    hasHover = "Yes",
    font = "Regular24",
    textAlignmentH = "Center"
}
____exports.MALineEdit = __TS__Class()
local MALineEdit = ____exports.MALineEdit
MALineEdit.name = "MALineEdit"
function MALineEdit.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
end
function MALineEdit.prototype.render(self, params)
    local ____params_0 = params
    local parent = ____params_0.parent
    local ____self_options_1 = self.options
    local id = ____self_options_1.id
    local signals = ____self_options_1.signals
    local uiObject = parent:Append("LineEdit")
    self:applyProps(uiObject)
    renderObjectSignals(
        nil,
        id,
        uiObject,
        signals,
        self.context
    )
    return uiObject
end
function MALineEdit.prototype.cleanup(self)
end
function MALineEdit.prototype.applyProps(self, obj)
    applyObjPropsWithDefaults(
        nil,
        obj,
        DEFALUT_PROPS,
        __TS__ObjectAssign({}, self.options.props, self.options.signals, {pluginComponent = self.context.pluginInfo.componentHandle})
    )
end
return ____exports
 end,
["lib.ui.components.ma.MAText"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local applyObjPropsWithDefaults = ____Utils.applyObjPropsWithDefaults
local DEFAULT_PROPS = {
    contentDriven = "Yes",
    contentWidth = "No",
    textAutoAdjust = "No",
    anchors = {left = 0, right = 0, top = 0, bottom = 0},
    padding = {left = 10, right = 10, top = 5, bottom = 5},
    font = "Regular20",
    hasHover = "No"
}
____exports.MAText = __TS__Class()
local MAText = ____exports.MAText
MAText.name = "MAText"
function MAText.prototype.____constructor(self, options, context)
    self.options = options
end
function MAText.prototype.render(self, renderContext)
    local ____renderContext_0 = renderContext
    local parent = ____renderContext_0.parent
    local uiObject = parent:Append("UIObject")
    self:applyProps(uiObject)
    return uiObject
end
function MAText.prototype.cleanup(self)
end
function MAText.prototype.applyProps(self, obj)
    applyObjPropsWithDefaults(nil, obj, DEFAULT_PROPS, self.options)
end
return ____exports
 end,
["lib.ui.components.ma.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____MAButton = require("lib.ui.components.ma.MAButton")
    local UIButton = ____MAButton.MAButton
    ____exports.UIButton = UIButton
end
do
    local ____MADialogFrame = require("lib.ui.components.ma.MADialogFrame")
    local UIDialogFrame = ____MADialogFrame.MADialogFrame
    ____exports.UIDialogFrame = UIDialogFrame
end
do
    local ____MALineEdit = require("lib.ui.components.ma.MALineEdit")
    local UILineEdit = ____MALineEdit.MALineEdit
    ____exports.UILineEdit = UILineEdit
end
do
    local ____MAText = require("lib.ui.components.ma.MAText")
    local UIText = ____MAText.MAText
    ____exports.UIText = UIText
end
do
    local ____MAUILayoutGrid = require("lib.ui.components.ma.MAUILayoutGrid")
    local HUILayoutGrid = ____MAUILayoutGrid.MAUILayoutGrid
    ____exports.HUILayoutGrid = HUILayoutGrid
end
return ____exports
 end,
["lib.ui.components.HSelectionGrid"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
local ____HUnidirectionalGrid = require("lib.ui.components.HUnidirectionalGrid")
local HUnidirectionalGrid = ____HUnidirectionalGrid.HUnidirectionalGrid
____exports.HSelectionGrid = __TS__Class()
local HSelectionGrid = ____exports.HSelectionGrid
HSelectionGrid.name = "HSelectionGrid"
function HSelectionGrid.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
    self.buttons = {}
    self.selectedItemId = options.selectedItemId
end
function HSelectionGrid.prototype.render(self, renderContext)
    local ____self_options_0 = self.options
    local id = ____self_options_0.id
    local items = ____self_options_0.items
    local selectedItemId = ____self_options_0.selectedItemId
    local onSelectionChange = ____self_options_0.onSelectionChange
    local optionsRest = __TS__ObjectRest(____self_options_0, {id = true, items = true, selectedItemId = true, onSelectionChange = true})
    return __TS__New(
        HUnidirectionalGrid,
        __TS__ObjectAssign(
            {},
            optionsRest,
            {children = __TS__ArrayMap(
                items,
                function(____, item)
                    local buttonId = (id .. "_") .. item.id
                    local child = {
                        comp = self.context.f:UIButton({
                            id = buttonId,
                            label = item.label,
                            props = {backColor = item.id == self.selectedItemId and UIColors.Selected or UIColors.Default, textColor = item.id == self.selectedItemId and UIColors.Background or UIColors.Lightened},
                            signals = {clicked = function()
                                onSelectionChange(nil, item.id)
                                self.selectedItemId = item.id
                                do
                                    local i = 0
                                    while i < #items do
                                        local curItem = items[i + 1]
                                        local curButton = self.buttons[i + 1]
                                        curButton:updateProps({backColor = curItem.id == self.selectedItemId and UIColors.Selected or UIColors.Default, textColor = curItem.id == self.selectedItemId and UIColors.Background or UIColors.Lightened})
                                        i = i + 1
                                    end
                                end
                            end}
                        }),
                        item = {sizePolicy = "Stretch", size = 1}
                    }
                    local ____self_buttons_1 = self.buttons
                    ____self_buttons_1[#____self_buttons_1 + 1] = child.comp
                    return child
                end
            )}
        ),
        self.context
    ):render(renderContext)
end
return ____exports
 end,
["lib.ui.components.HTableGrid"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
function ____exports.TableDivider(self)
    return {type = "divider"}
end
____exports.DEFAULT_DIVIDER_WIDTH = 5
local DEFAULT_OPTIONS = {w = "100%", h = "100%"}
local DEFAULT_DIVIDER_COLOR = UIColors.FrameColor
____exports.HTableGrid = __TS__Class()
local HTableGrid = ____exports.HTableGrid
HTableGrid.name = "HTableGrid"
function HTableGrid.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
    self.log = self.context.log
end
function HTableGrid.prototype.render(self, renderContext)
    self.log:trace("HTableGrid.render()")
    local ____self_options_0 = self.options
    local columns = ____self_options_0.columns
    local rowSize = ____self_options_0.rowSize
    local rows = ____self_options_0.rows
    local optionsRest = __TS__ObjectRest(____self_options_0, {columns = true, rowSize = true, rows = true})
    local optionsWithDefaults = __TS__ObjectAssign(optionsRest, DEFAULT_OPTIONS)
    local titleBar = {
        comp = self.context.f:HHorizontalGrid({children = __TS__ArrayMap(
            columns,
            function(____, column)
                return {
                    comp = self.context.f:UIText({text = column.label, backColor = UIColors.BackgroundSelectedInverted}),
                    item = column.item
                }
            end
        )}),
        item = rowSize
    }
    local dataRows = __TS__ArrayMap(
        rows,
        function(____, row)
            if row.type == "divider" then
                return {
                    comp = self.context.f:UIText({backColor = DEFAULT_DIVIDER_COLOR}),
                    item = {sizePolicy = "Fixed", size = ____exports.DEFAULT_DIVIDER_WIDTH}
                }
            else
                local rowComponents = row
                local rowGrid = self.context.f:HHorizontalGrid({children = __TS__ArrayMap(
                    rowComponents,
                    function(____, cellComponent, index)
                        return {comp = cellComponent, item = columns[index + 1].item}
                    end
                )})
                return {comp = rowGrid, item = rowSize}
            end
        end
    )
    local grid = self.context.f:HVerticalGrid(__TS__ObjectAssign(
        {},
        optionsWithDefaults,
        {children = {
            titleBar,
            table.unpack(dataRows)
        }}
    )):render(renderContext)
    return grid
end
return ____exports
 end,
["lib.ui.components.HToggle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.HToggle = __TS__Class()
local HToggle = ____exports.HToggle
HToggle.name = "HToggle"
function HToggle.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
    self.state = options.initialState
end
function HToggle.prototype.render(self, renderContext)
    local thread = coroutine.running()
    self.context.log:trace("HToggle.render(), co=" .. tostring(thread))
    local ____self_options_0 = self.options
    local id = ____self_options_0.id
    local label = ____self_options_0.label
    local initialState = ____self_options_0.initialState
    local onChange = ____self_options_0.onChange
    local restOptions = __TS__ObjectRest(____self_options_0, {id = true, label = true, initialState = true, onChange = true})
    local function labelAndIconOptions()
        return __TS__ObjectAssign({}, label.type == "text" and ({label = self.state and label.onText or label.offText}) or ({label = ""}), label.type == "icon" and ({icon = self.state and label.onIcon or label.offIcon}) or ({icon = ""}))
    end
    local button = self.context.f:UIButton(__TS__ObjectAssign(
        {id = id},
        labelAndIconOptions(nil),
        {
            signals = __TS__ObjectAssign(
                {},
                restOptions.signals == nil and ({}) or restOptions.signals,
                {clicked = function(____, caller)
                    self.state = not self.state
                    local newOptions = labelAndIconOptions(nil)
                    self.button:update(labelAndIconOptions(nil))
                    onChange(nil, self.state)
                end}
            ),
            props = restOptions.props
        }
    ))
    self.button = button
    return button:render(renderContext)
end
return ____exports
 end,
["lib.ui.components.UIInputBox"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
local ____Utils = require("lib.Utils")
local applyObjProps = ____Utils.applyObjProps
local applyObjPropsWithDefaults = ____Utils.applyObjPropsWithDefaults
local ____MALineEdit = require("lib.ui.components.ma.MALineEdit")
local MALineEdit = ____MALineEdit.MALineEdit
____exports.UIInputBox = __TS__Class()
local UIInputBox = ____exports.UIInputBox
UIInputBox.name = "UIInputBox"
function UIInputBox.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
    self.lastValidValue = options.value
end
function UIInputBox.prototype.setText(self, text)
    local lineEdit = self.lineEdit
    if lineEdit ~= nil then
        lineEdit.content = text
    end
end
function UIInputBox.prototype.render(self, renderContext)
    local ____self_options_0 = self.options
    local ____type = ____self_options_0.type
    local isValid = ____self_options_0.isValid
    local label = ____self_options_0.label
    local value = ____self_options_0.value
    local props = ____self_options_0.props
    local signals = ____self_options_0.signals
    local onChange = ____self_options_0.onChange
    local optionsRest = __TS__ObjectRest(____self_options_0, {
        type = true,
        isValid = true,
        label = true,
        value = true,
        props = true,
        signals = true,
        onChange = true
    })
    local function onTextChange(____, lineEdit)
        local function isValidFn(____, value)
            if ____type == "POSITIVE_NUMBER" and type(value) == "number" then
                local ____self_options_1 = self.options
                local range = ____self_options_1.range
                if value < 1 then
                    return false
                elseif range ~= nil then
                    if range.min ~= nil and value < range.min then
                        return false
                    end
                    if range.max ~= nil and value > range.max then
                        return false
                    end
                elseif isValid ~= nil then
                    return isValid(nil, value)
                end
            elseif isValid ~= nil then
                return isValid(nil, value)
            end
            return true
        end
        local value = ____type == "POSITIVE_NUMBER" and __TS__ParseInt(lineEdit.content) or lineEdit.content
        local valid = isValidFn(nil, value)
        if valid then
            self.lastValidValue = value
            if onChange ~= nil then
                onChange(nil, value)
            end
        else
            self.lineEdit.content = tostring(self.lastValidValue)
        end
    end
    local _signals = applyObjProps(
        nil,
        {
            focusGet = function()
                local lineEdit = self.lineEdit
                lineEdit:SelectAll()
            end,
            focusLost = function()
                local lineEdit = self.lineEdit
                lineEdit:DeSelect()
                onTextChange(nil, self.lineEdit)
            end,
            textChanged = function(____, caller)
                onTextChange(nil, caller)
            end
        },
        signals == nil and ({}) or signals
    )
    local _props = applyObjPropsWithDefaults(
        nil,
        {backColor = UIColors.Transparent, textChangeOnEnter = 1},
        props,
        __TS__ObjectAssign(
            {},
            ____type == "POSITIVE_NUMBER" and ({vkPluginName = "NumericInput", filter = "1234567890", vkTitleHint = label}) or ({}),
            {content = tostring(value)}
        )
    )
    self.lineEdit = __TS__New(
        MALineEdit,
        __TS__ObjectAssign({}, optionsRest, {label = label, props = _props, signals = _signals}),
        self.context
    ):render(renderContext)
    return self.lineEdit
end
function UIInputBox.prototype.cleanup(self)
end
return ____exports
 end,
["lib.ui.components.UIFactory"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HActionList = require("lib.ui.components.HActionList")
local HActionList = ____HActionList.HActionList
local ____HHorizontalGrid = require("lib.ui.components.HHorizontalGrid")
local HHorizontalGrid = ____HHorizontalGrid.HHorizontalGrid
local ____HInputFieldGrid = require("lib.ui.components.HInputFieldGrid")
local HInputFieldGrid = ____HInputFieldGrid.HInputFieldGrid
local ____HSelectionGrid = require("lib.ui.components.HSelectionGrid")
local HSelectionGrid = ____HSelectionGrid.HSelectionGrid
local ____HTableGrid = require("lib.ui.components.HTableGrid")
local HTableGrid = ____HTableGrid.HTableGrid
local ____HToggle = require("lib.ui.components.HToggle")
local HToggle = ____HToggle.HToggle
local ____HUnidirectionalGrid = require("lib.ui.components.HUnidirectionalGrid")
local HUnidirectionalGrid = ____HUnidirectionalGrid.HUnidirectionalGrid
local ____HVerticalGrid = require("lib.ui.components.HVerticalGrid")
local HVerticalGrid = ____HVerticalGrid.HVerticalGrid
local ____ma = require("lib.ui.components.ma.index")
local HUILayoutGrid = ____ma.HUILayoutGrid
local UIButton = ____ma.UIButton
local UIDialogFrame = ____ma.UIDialogFrame
local UILineEdit = ____ma.UILineEdit
local UIText = ____ma.UIText
local ____UIInputBox = require("lib.ui.components.UIInputBox")
local UIInputBox = ____UIInputBox.UIInputBox
____exports.UIFactory = __TS__Class()
local UIFactory = ____exports.UIFactory
UIFactory.name = "UIFactory"
function UIFactory.prototype.____constructor(self, options)
    self.context = __TS__ObjectAssign({}, options, {f = self})
end
function UIFactory.prototype.UIText(self, options)
    return __TS__New(UIText, options, self.context)
end
function UIFactory.prototype.UIButton(self, options)
    return __TS__New(UIButton, options, self.context)
end
function UIFactory.prototype.UILineEdit(self, options)
    return __TS__New(UILineEdit, options, self.context)
end
function UIFactory.prototype.UIInputBox(self, options)
    return __TS__New(UIInputBox, options, self.context)
end
function UIFactory.prototype.UIDialogFrame(self, options)
    return __TS__New(UIDialogFrame, options, self.context)
end
function UIFactory.prototype.HUILayoutGrid(self, options)
    return __TS__New(HUILayoutGrid, options, self.context)
end
function UIFactory.prototype.HActionList(self, options)
    return __TS__New(HActionList, options, self.context)
end
function UIFactory.prototype.HHorizontalGrid(self, options)
    return __TS__New(HHorizontalGrid, options, self.context)
end
function UIFactory.prototype.HInputFieldGrid(self, options)
    return __TS__New(HInputFieldGrid, options, self.context)
end
function UIFactory.prototype.HSelectionGrid(self, options)
    return __TS__New(HSelectionGrid, options, self.context)
end
function UIFactory.prototype.HTableGrid(self, options)
    return __TS__New(HTableGrid, options, self.context)
end
function UIFactory.prototype.HToggle(self, options)
    return __TS__New(HToggle, options, self.context)
end
function UIFactory.prototype.HUnidirectionalGrid(self, options)
    return __TS__New(HUnidirectionalGrid, options, self.context)
end
function UIFactory.prototype.HVerticalGrid(self, options)
    return __TS__New(HVerticalGrid, options, self.context)
end
return ____exports
 end,
["lib.ui.components.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.ui.components.HUnidirectionalGrid"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local DEFAULT_OPTIONS = {w = "100%", h = "100%"}
____exports.HUnidirectionalGrid = __TS__Class()
local HUnidirectionalGrid = ____exports.HUnidirectionalGrid
HUnidirectionalGrid.name = "HUnidirectionalGrid"
function HUnidirectionalGrid.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
    self.log = self.context.log
end
function HUnidirectionalGrid.prototype.render(self, renderContext)
    local ____self_options_0 = self.options
    local children = ____self_options_0.children
    local visitChild = ____self_options_0.visitChild
    local direction = ____self_options_0.direction
    local optionsRest = __TS__ObjectRest(____self_options_0, {children = true, visitChild = true, direction = true})
    local optionsWithDefaults = __TS__ObjectAssign(optionsRest, DEFAULT_OPTIONS)
    local grid = self.context.f:HUILayoutGrid(__TS__ObjectAssign(
        {},
        optionsWithDefaults,
        {
            columns = direction == "Vertical" and ({{sizePolicy = "Stretch", size = 1}}) or __TS__ArrayMap(
                children,
                function(____, r) return r.item end
            ),
            rows = direction == "Vertical" and __TS__ArrayMap(
                children,
                function(____, r) return r.item end
            ) or ({{sizePolicy = "Stretch", size = 1}}),
            anchors = self.options.anchors == nil and ({top = 0, bottom = 0, right = 0, left = 0}) or self.options.anchors,
            visitChild = function(____, child, index)
                child.anchors = direction == "Vertical" and ({left = 0, right = 0, top = index, bottom = index}) or ({left = index, right = index, top = 0, bottom = 0})
                if visitChild ~= nil then
                    visitChild(nil, child, index)
                end
            end
        }
    )):setChildren(__TS__ArrayMap(
        children,
        function(____, r) return r.comp end
    )):render(renderContext)
    return grid
end
function ____exports.ifDefinedChild(self, child, itemProps)
    return child == nil and ({}) or ({{comp = child, item = itemProps}})
end
return ____exports
 end,
["lib.ui.components.HVerticalGrid"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HUnidirectionalGrid = require("lib.ui.components.HUnidirectionalGrid")
local HUnidirectionalGrid = ____HUnidirectionalGrid.HUnidirectionalGrid
____exports.HVerticalGrid = __TS__Class()
local HVerticalGrid = ____exports.HVerticalGrid
HVerticalGrid.name = "HVerticalGrid"
function HVerticalGrid.prototype.____constructor(self, options, context)
    self.options = options
    self.context = context
end
function HVerticalGrid.prototype.render(self, renderContext)
    self.context.log:trace("HVerticalGrid.render() children.length=" .. tostring(#self.options.children))
    return __TS__New(
        HUnidirectionalGrid,
        __TS__ObjectAssign({}, self.options, {direction = "Vertical"}),
        self.context
    ):render(renderContext)
end
return ____exports
 end,
["lib.ui.components.CustomDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local applyObjProps = ____Utils.applyObjProps
local applyObjPropsWithDefaults = ____Utils.applyObjPropsWithDefaults
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
local ____UIFactory = require("lib.ui.components.UIFactory")
local UIFactory = ____UIFactory.UIFactory
____exports.CustomDialog = __TS__Class()
local CustomDialog = ____exports.CustomDialog
CustomDialog.name = "CustomDialog"
function CustomDialog.prototype.____constructor(self, params)
    self.params = params
    local ____params_0 = params
    local log = ____params_0.log
    local pluginInfo = ____params_0.pluginInfo
    local pluginSignals = ____params_0.pluginSignals
    self.log = log
    self.ui = __TS__New(UIFactory, {pluginInfo = pluginInfo, pluginSignals = pluginSignals, log = self.log})
end
function CustomDialog.prototype.setContent(self, obj)
    self.content = obj
end
function CustomDialog.prototype.show(self, display)
    local ____self_params_1 = self.params
    local options = ____self_params_1.options
    local colorTransparent = UIColors.Transparent
    local baseInput = self:createBaseInput(display)
    local dialogFrame = self.ui:UIDialogFrame({})
    if options.subTitle ~= nil then
        local subTitle = self.ui:UIText({text = options.subTitle, backColor = colorTransparent})
        local contentItem = self.content ~= nil and ({comp = self.content, item = {sizePolicy = "Content"}}) or nil
        local content = self.ui:HVerticalGrid({children = {
            {comp = subTitle, item = {sizePolicy = "Content"}},
            table.unpack(contentItem ~= nil and ({contentItem}) or ({}))
        }})
        dialogFrame:setContent(content)
    else
        if self.content ~= nil then
            dialogFrame:setContent(self.content)
        end
    end
    local uiLayoutGrid = dialogFrame:render({parent = baseInput})
end
function CustomDialog.prototype.createBaseInput(self, display)
    local screenOverlay = display.ScreenOverlay
    screenOverlay:ClearUIChildren()
    local dialogWidth = 650
    local baseInput = screenOverlay:Append("BaseInput")
    applyObjProps(
        nil,
        baseInput,
        {
            name = self.params.options.id,
            h = 0,
            w = dialogWidth,
            maxSize = (tostring(display.w * 0.8) .. ",") .. tostring(display.h),
            minSize = (tostring(dialogWidth - 100) .. ",") .. 0,
            columns = 1,
            rows = 2,
            autoClose = "No",
            closeOnEscape = "Yes"
        }
    )
    local titleBar = baseInput:Append("TitleBar")
    applyObjProps(nil, titleBar, {columns = 2, rows = 1, anchors = "0,0", texture = "corner2"})
    titleBar[2][2].sizePolicy = "Fixed"
    titleBar[2][2].size = 50
    local titleBarIcon = titleBar:Append("TitleButton")
    applyObjPropsWithDefaults(nil, titleBarIcon, {textAlignmentH = "Center"}, {text = self.params.options.title, textAlignmentH = self.params.options.titleAlign, texture = "corner1", anchors = "0,0"})
    local titleBarCloseButton = titleBar:Append("CloseButton")
    titleBarCloseButton.anchors = "1,0"
    titleBarCloseButton.texture = "corner2"
    return baseInput
end
return ____exports
 end,
["lib.ui.components.ModalDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local applyObjProps = ____Utils.applyObjProps
local applyObjPropsWithDefaults = ____Utils.applyObjPropsWithDefaults
local ____UIFactory = require("lib.ui.components.UIFactory")
local UIFactory = ____UIFactory.UIFactory
____exports.ModalDialog = __TS__Class()
local ModalDialog = ____exports.ModalDialog
ModalDialog.name = "ModalDialog"
function ModalDialog.prototype.____constructor(self, params)
    self.params = params
    local ____params_0 = params
    local log = ____params_0.log
    local pluginInfo = ____params_0.pluginInfo
    local pluginSignals = ____params_0.pluginSignals
    self.log = log
    self.ui = __TS__New(UIFactory, {pluginInfo = pluginInfo, pluginSignals = pluginSignals, log = self.log})
end
function ModalDialog.prototype.setContent(self, obj)
    self.content = obj
end
function ModalDialog.prototype.closeDialog(self)
    if self.popup ~= nil and self.modalOverlay ~= nil then
        self.popup:Close()
        WaitObjectDelete(self.popup, 1)
    end
end
function ModalDialog.prototype.show(self, display)
    local ____self_params_1 = self.params
    local options = ____self_params_1.options
    local ____options_2 = options
    local width = ____options_2.width
    local popup = self:createPopupInAPlaceHolder(display)
    popup[1][2].sizePolicy = "Content"
    if width ~= nil then
        popup[2][1].sizePolicy = "Fixed"
        popup[2][1].size = width
    end
    local dialogFrame = self.ui:UIDialogFrame({h = "100%", w = "100%", anchors = {left = 0, right = 0, top = 1, bottom = 1}})
    if self.content ~= nil then
        dialogFrame:setContent(self.content)
    end
    local uiLayoutGrid = dialogFrame:render({parent = popup})
    self.log:trace("ModalDialog.show() END")
end
function ModalDialog.prototype.createPopupInAPlaceHolder(self, display)
    local ____self_params_options_3 = self.params.options
    local id = ____self_params_options_3.id
    local title = ____self_params_options_3.title
    local titleAlign = ____self_params_options_3.titleAlign
    local titleFont = ____self_params_options_3.titleFont
    local modalOverlay = display.ModalOverlay
    self.modalOverlay = modalOverlay
    local popup = modalOverlay:Append("Popup")
    self.popup = popup
    local closeCallbackSignalId = id .. "_handleOverlayClose"
    popup:OverlaySetCloseCallback(closeCallbackSignalId, popup)
    local function onCloseFn(caller, modalResult, modalValue, ctx)
        popup:OverlaySetCloseCallback("")
        popup:Close()
    end
    self.params.pluginSignals:registerHandler(closeCallbackSignalId, onCloseFn)
    popup[1][1].sizePolicy = "Fixed"
    popup[1][1].size = 75
    applyObjProps(nil, popup, {ALIGNMENTH = "Center", ALIGNMENTV = "Center"})
    local titleBar = popup:Append("TitleBar")
    applyObjProps(nil, titleBar, {columns = 2, rows = 1, anchors = "0,0", texture = "corner2"})
    titleBar[2][2].sizePolicy = "Fixed"
    titleBar[2][2].size = 50
    local titleBarIcon = titleBar:Append("TitleButton")
    applyObjPropsWithDefaults(nil, titleBarIcon, {textAlignmentH = "Center"}, {
        text = title,
        textAlignmentH = titleAlign,
        font = titleFont or "Regular28",
        texture = "corner1",
        anchors = "0,0",
        textShadow = 0
    })
    local titleBarCloseButton = titleBar:Append("CloseButton")
    titleBarCloseButton.anchors = "1,0"
    titleBarCloseButton.texture = "corner2"
    return popup
end
return ____exports
 end,
["lib.ui.components.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____export = require("lib.ui.components.CustomDialog")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HActionList")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HHorizontalGrid")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HInputFieldGrid")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HInputFieldGridTypes")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HSelectionGrid")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HTableGrid")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HUnidirectionalGrid")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.HVerticalGrid")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.ma.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.ModalDialog")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.UIFactory")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.ui.components.UIInputBox")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lib.ui.dialogs.UserDialogBase"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.UserDialogBase = __TS__Class()
local UserDialogBase = ____exports.UserDialogBase
UserDialogBase.name = "UserDialogBase"
function UserDialogBase.prototype.____constructor(self, plugin, modalOptions)
    self.plugin = plugin
    self.modalOptions = modalOptions
    self.dialog = self.plugin.dialogFactory:ModalDialog(self.modalOptions)
    self.ui = self.dialog.ui
    self.log = self.plugin.log
end
function UserDialogBase.prototype.show(self, displayHandle)
    self.dialog:setContent(self:getContent())
    self.dialog:show(displayHandle)
end
function UserDialogBase.prototype.close(self)
    if self.dialog ~= nil then
        self.dialog:closeDialog()
    end
end
return ____exports
 end,
["lib.ui.dialogs.ActionDialogV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
local ____components = require("lib.ui.components.index")
local ifDefinedChild = ____components.ifDefinedChild
local ____HActionList = require("lib.ui.components.HActionList")
local DEFAULT_ACTION_HEIGHT = ____HActionList.DEFAULT_ACTION_HEIGHT
local ____UserDialogBase = require("lib.ui.dialogs.UserDialogBase")
local UserDialogBase = ____UserDialogBase.UserDialogBase
____exports.ActionDialogV2 = __TS__Class()
local ActionDialogV2 = ____exports.ActionDialogV2
ActionDialogV2.name = "ActionDialogV2"
__TS__ClassExtends(ActionDialogV2, UserDialogBase)
function ActionDialogV2.prototype.____constructor(self, plugin, options)
    self.options = options
    local ____options_0 = options
    local id = ____options_0.id
    local title = ____options_0.title
    local width = ____options_0.width
    local actions = ____options_0.actions
    UserDialogBase.prototype.____constructor(self, plugin, {id = id, title = title, width = width})
end
function ActionDialogV2.prototype.getContent(self)
    local ____self_options_1 = self.options
    local id = ____self_options_1.id
    local message = ____self_options_1.message
    local messageWidth = ____self_options_1.messageWidth
    local body = ____self_options_1.body
    local actionListOptions = ____self_options_1.actions
    local ____actionListOptions_2 = actionListOptions
    local _actionHeight = ____actionListOptions_2.actionHeight
    local direction = ____actionListOptions_2.direction
    local restActionListOptions = __TS__ObjectRest(____actionListOptions_2, {actionHeight = true, direction = true})
    local actionHeight = _actionHeight == nil and DEFAULT_ACTION_HEIGHT or _actionHeight
    local ui = self.ui
    local actionsRow = {
        comp = ui:HActionList(__TS__ObjectAssign({}, restActionListOptions, {direction = direction, actionHeight = actionHeight, id = id .. "_actionList"})),
        item = direction == "Vertical" and ({sizePolicy = "Content"}) or ({sizePolicy = "Fixed", size = actionHeight})
    }
    local messageRow = {
        comp = ui:UIText({
            backColor = UIColors.Background,
            text = tostring(message) .. "\n\n",
            w = messageWidth,
            alignmentH = "Center"
        }),
        item = {sizePolicy = "Content"}
    }
    local ____array_5 = __TS__SparseArrayNew(table.unpack(message == nil and ({}) or ({messageRow})))
    local ____ifDefinedChild_4 = ifDefinedChild
    local ____temp_3
    if body == nil then
        ____temp_3 = nil
    else
        ____temp_3 = body(nil, self.ui)
    end
    __TS__SparseArrayPush(
        ____array_5,
        table.unpack(____ifDefinedChild_4(nil, ____temp_3, {sizePolicy = "Content"}))
    )
    __TS__SparseArrayPush(____array_5, actionsRow)
    local children = {__TS__SparseArraySpread(____array_5)}
    return ui:HVerticalGrid({children = children})
end
return ____exports
 end,
["lib.ui.dialogs.AlertDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MessageBoxHelperV2 = require("lib.ui.MessageBoxHelperV2")
local showMessageBox = ____MessageBoxHelperV2.showMessageBox
function ____exports.AlertDialog(self, options)
    local ____options_0 = options
    local title = ____options_0.title
    local message = ____options_0.message
    local function show(self, displayHandle)
        local result = showMessageBox(
            nil,
            {
                title = title,
                message = message,
                display = displayHandle.index,
                commands = {{
                    label = "Ok",
                    action = function(self)
                        return {type = "PopDialog"}
                    end
                }}
            }
        )
        return result or ({type = "PopDialog"})
    end
    return {show = show}
end
return ____exports
 end,
["lib.ui.dialogs.AlertDialogV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
local ____UserDialogBase = require("lib.ui.dialogs.UserDialogBase")
local UserDialogBase = ____UserDialogBase.UserDialogBase
____exports.AlertDialogV2 = __TS__Class()
local AlertDialogV2 = ____exports.AlertDialogV2
AlertDialogV2.name = "AlertDialogV2"
__TS__ClassExtends(AlertDialogV2, UserDialogBase)
function AlertDialogV2.prototype.____constructor(self, plugin, options)
    self.options = options
    local ____options_0 = options
    local id = ____options_0.id
    local title = ____options_0.title
    local message = ____options_0.message
    local width = ____options_0.width
    local actionLabel = ____options_0.actionLabel
    local onAction = ____options_0.onAction
    local font = ____options_0.font
    local align = ____options_0.align
    UserDialogBase.prototype.____constructor(self, plugin, {id = id, title = title, width = width})
end
function AlertDialogV2.prototype.getContent(self)
    local ____self_options_1 = self.options
    local id = ____self_options_1.id
    local title = ____self_options_1.title
    local message = ____self_options_1.message
    local textHeight = ____self_options_1.textHeight
    local actionLabel = ____self_options_1.actionLabel
    local onAction = ____self_options_1.onAction
    local font = ____self_options_1.font
    local align = ____self_options_1.align
    return self.ui:HVerticalGrid({children = {
        {
            comp = self.ui:UIText({text = message, font = font, backColor = UIColors.Background, textAlignmentH = align}),
            item = textHeight == nil and ({sizePolicy = "Content"}) or ({sizePolicy = "Fixed", size = textHeight})
        },
        {
            comp = self.ui:UIButton({
                id = "ok",
                label = actionLabel == nil and "OK" or actionLabel,
                signals = {clicked = function(____, caller)
                    self.plugin:dialogAction({type = "PopDialog"})
                end}
            }),
            item = {sizePolicy = "Fixed", size = 50}
        }
    }})
end
return ____exports
 end,
["lib.ui.dialogs.ConfirmDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MessageBoxHelperV2 = require("lib.ui.MessageBoxHelperV2")
local showMessageBox = ____MessageBoxHelperV2.showMessageBox
function ____exports.ConfirmDialog(self, options)
    local ____options_0 = options
    local title = ____options_0.title
    local message = ____options_0.message
    local confirmLabel = ____options_0.confirmLabel
    local onConfirmAction = ____options_0.onConfirmAction
    local function show(self, displayHandle)
        local result = showMessageBox(
            nil,
            {
                title = title,
                message = message,
                display = displayHandle.index,
                commands = {
                    {
                        label = confirmLabel or "Confirm",
                        action = function(self)
                            return onConfirmAction(nil) or ({type = "PopDialog"})
                        end
                    },
                    {
                        type = "abort",
                        label = "Cancel",
                        action = function(self)
                            return {type = "PopDialog"}
                        end
                    }
                }
            }
        )
        return result or ({type = "PopDialog"})
    end
    return {show = show}
end
return ____exports
 end,
["lib.ui.dialogs.FormDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
local ____components = require("lib.ui.components.index")
local DEFAULT_ACTION_HEIGHT = ____components.DEFAULT_ACTION_HEIGHT
local ifDefinedChild = ____components.ifDefinedChild
local ____UserDialogBase = require("lib.ui.dialogs.UserDialogBase")
local UserDialogBase = ____UserDialogBase.UserDialogBase
____exports.FormDialog = __TS__Class()
local FormDialog = ____exports.FormDialog
FormDialog.name = "FormDialog"
__TS__ClassExtends(FormDialog, UserDialogBase)
function FormDialog.prototype.____constructor(self, plugin, options)
    self.options = options
    local ____options_0 = options
    local title = ____options_0.title
    local id = ____options_0.id
    local width = ____options_0.width
    UserDialogBase.prototype.____constructor(self, plugin, {id = id, title = title, width = width})
end
function FormDialog.prototype.getContent(self)
    local ____self_options_1 = self.options
    local id = ____self_options_1.id
    local message = ____self_options_1.message
    local messageWidth = ____self_options_1.messageWidth
    local errorMessage = ____self_options_1.errorMessage
    local width = ____self_options_1.width
    local submitLabel = ____self_options_1.submitLabel
    local isValid = ____self_options_1.isValid
    local onSubmit = ____self_options_1.onSubmit
    local inputFields = ____self_options_1.inputFields
    local data = ____self_options_1.data
    local ui = self.ui
    local ____temp_2
    if errorMessage == nil then
        ____temp_2 = message
    else
        ____temp_2 = errorMessage
    end
    local _message = ____temp_2
    local ____temp_7
    if _message == nil then
        ____temp_7 = nil
    else
        local ____ui_UIText_6 = ui.UIText
        local ____UIColors_Background_4 = UIColors.Background
        local ____temp_5 = _message .. "\n\n"
        local ____temp_3
        if errorMessage == nil then
            ____temp_3 = nil
        else
            ____temp_3 = UIColors.AlertText
        end
        ____temp_7 = ____ui_UIText_6(ui, {
            backColor = ____UIColors_Background_4,
            text = ____temp_5,
            textColor = ____temp_3,
            w = messageWidth,
            alignmentH = "Center"
        })
    end
    local messageComp = ____temp_7
    local actionHeight = DEFAULT_ACTION_HEIGHT
    local actionsRow = {
        comp = ui:HActionList({
            id = id .. "_actionList",
            direction = "Horizontal",
            actionHeight = actionHeight,
            actions = {
                {
                    label = submitLabel,
                    action = function()
                        local dataIsValid = true
                        local errorMessage = ""
                        if isValid ~= nil then
                            local validaitonResult = isValid(nil, data)
                            if not validaitonResult.isValid then
                                dataIsValid = false
                                errorMessage = validaitonResult.errorMsg
                            end
                        end
                        if dataIsValid then
                            onSubmit(nil, data)
                        else
                            self.plugin:dialogAction({
                                type = "ReplaceDialog",
                                dialog = __TS__New(
                                    ____exports.FormDialog,
                                    self.plugin,
                                    __TS__ObjectAssign({}, self.options, {errorMessage = errorMessage})
                                )
                            })
                        end
                    end
                },
                {
                    label = "Cancel",
                    action = function()
                        self.plugin:dialogAction({type = "PopDialog"})
                    end
                }
            }
        }),
        item = {sizePolicy = "Fixed", size = actionHeight}
    }
    local ____ui_HVerticalGrid_9 = ui.HVerticalGrid
    local ____array_8 = __TS__SparseArrayNew(table.unpack(ifDefinedChild(nil, messageComp, {sizePolicy = "Content"})))
    __TS__SparseArrayPush(
        ____array_8,
        {
            comp = ui:HInputFieldGrid({
                data = data,
                labelColumnSize = {sizePolicy = "Fixed", size = 200},
                valueColumnSize = {sizePolicy = "Stretch", size = 1},
                rowSize = {sizePolicy = "Fixed", size = 50},
                inputFields = __TS__ArrayMap(
                    inputFields,
                    function(____, field)
                        if field.onChange == nil then
                            field.onChange = function(____, value)
                                data[field.id] = value
                            end
                        end
                        return field
                    end
                )
            }),
            item = {sizePolicy = "Content"}
        },
        actionsRow
    )
    return ____ui_HVerticalGrid_9(
        ui,
        {children = {__TS__SparseArraySpread(____array_8)}}
    )
end
return ____exports
 end,
["lib.ui.dialogs.InputFieldDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local showMessageBox = ____ui.showMessageBox
function ____exports.InputFieldDialog(self, options)
    local ____options_0 = options
    local fieldType = ____options_0.type
    local fieldLabel = ____options_0.label
    local isValid = ____options_0.isValid
    local title = ____options_0.title
    local initialValue = ____options_0.initialValue
    local onCompleted = ____options_0.onCompleted
    local function show(self, displayHandle)
        local result = showMessageBox(
            nil,
            {
                title = title,
                display = displayHandle.index,
                commands = {
                    {
                        label = "Update",
                        action = function(self, data)
                            onCompleted(nil, data.inputs.value)
                            return {type = "Quit"}
                        end
                    },
                    {
                        type = "abort",
                        label = "Cancel",
                        action = function(self)
                            return {type = "Quit"}
                        end
                    }
                },
                inputs = {{
                    id = "value",
                    label = fieldLabel,
                    type = fieldType == "string" and "STRING" or "POSITIVE_NUMBER",
                    value = tostring(initialValue),
                    isValid = isValid
                }}
            }
        )
        return result or ({type = "Quit"})
    end
    return {show = show}
end
return ____exports
 end,
["lib.ui.dialogs.MultiActionDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MessageBoxHelperV2 = require("lib.ui.MessageBoxHelperV2")
local showMessageBox = ____MessageBoxHelperV2.showMessageBox
function ____exports.MultiActionDialog(self, options)
    local ____options_0 = options
    local title = ____options_0.title
    local message = ____options_0.message
    local actions = ____options_0.actions
    local function show(self, displayHandle)
        local result = showMessageBox(
            nil,
            {
                title = title,
                message = message,
                display = displayHandle.index,
                commands = __TS__ArrayMap(
                    actions,
                    function(____, action)
                        return {
                            label = action.label,
                            action = function() return action:action() end
                        }
                    end
                )
            }
        )
        return result or ({type = "PopDialog"})
    end
    return {show = show}
end
return ____exports
 end,
["lib.ui.dialogs.SimpleInstanceDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ActionDialogV2 = require("lib.ui.dialogs.ActionDialogV2")
local ActionDialogV2 = ____ActionDialogV2.ActionDialogV2
function ____exports.SimpleInstanceDialog(self, plugin, instanceId, configureDialog)
    local ____ActionDialogV2_5 = ActionDialogV2
    local ____plugin_4 = plugin
    local ____temp_2 = "simple_instance_" .. instanceId
    local ____temp_3 = "Instance " .. instanceId
    local ____temp_1 = ("simple_instance_" .. instanceId) .. "_actions"
    local ____array_0 = __TS__SparseArrayNew(table.unpack(configureDialog == nil and ({}) or ({{
        label = "Configure",
        action = function()
            plugin:dialogAction({
                type = "PushDialog",
                dialog = configureDialog(nil, instanceId)
            })
        end
    }})))
    __TS__SparseArrayPush(
        ____array_0,
        {
            label = "Delete",
            action = function()
                plugin:handlePluginEvent(
                    "Delete Instance",
                    function(____, context)
                        plugin:deleteInstance(context, instanceId)
                    end
                )
                plugin:dialogAction({type = "PopDialog"})
            end
        }
    )
    return __TS__New(
        ____ActionDialogV2_5,
        ____plugin_4,
        {
            id = ____temp_2,
            width = 300,
            title = ____temp_3,
            actions = {
                id = ____temp_1,
                direction = "Vertical",
                actions = {__TS__SparseArraySpread(____array_0)}
            }
        }
    )
end
return ____exports
 end,
["lib.ui.dialogs.UninstallDialogV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____RangeUtils = require("lib.RangeUtils")
local RangeUtils = ____RangeUtils.RangeUtils
local ____ActionDialogV2 = require("lib.ui.dialogs.ActionDialogV2")
local ActionDialogV2 = ____ActionDialogV2.ActionDialogV2
local ____AlertDialogV2 = require("lib.ui.dialogs.AlertDialogV2")
local AlertDialogV2 = ____AlertDialogV2.AlertDialogV2
function ____exports.UninstallDialogV2(self, plugin)
    local getUninstallMessage
    function getUninstallMessage(self)
        local ____plugin_pu_pluginEnv_1 = plugin.pu.pluginEnv
        local pluginId = ____plugin_pu_pluginEnv_1.pluginId
        local pluginName = ____plugin_pu_pluginEnv_1.pluginName
        return plugin.eventHandler:handlePluginEventReadOnly(
            "Uninstall Prompt",
            function(____, context)
                local provisionedPoolIds = context.mainAssetManager:getProvisionedPoolIds()
                return ((((((((("\n    This will delete everything related to the " .. pluginName) .. " plugin.\n\n    Including:\n    - All Addon Variables named:\n \"") .. pluginId) .. "\"\n\n    - Generated DataPool objects:\n\n    ") .. __TS__ArrayReduce(
                    provisionedPoolIds,
                    function(____, result, poolId)
                        return result .. ((poolId .. ": ") .. RangeUtils:describe(context.subPoolRegistry:getPluginInternalSubPool(pluginId, poolId).range)) .. "\n"
                    end,
                    ""
                )) .. "\n    ") .. (context.pluginData.builtInImagesInstalled and "- Image library images under: " .. context.imageManager.imageLibraryPath or "")) .. "\n    \n\n    ") .. (context.midiRemotes:isMidiRemoteProvisioned() and "- MidiRemotes named with the pluginId prefix\n" or "")) .. "\n    After it's done , you can simply delete the plugin object from the plugins pool."
            end
        )
    end
    local ____plugin_pu_pluginEnv_0 = plugin.pu.pluginEnv
    local pluginId = ____plugin_pu_pluginEnv_0.pluginId
    local pluginName = ____plugin_pu_pluginEnv_0.pluginName
    return __TS__New(
        ActionDialogV2,
        plugin,
        {
            id = pluginId .. "_uninstall",
            title = pluginName .. ": Uninstall",
            width = 1000,
            message = getUninstallMessage(nil),
            actions = {
                id = pluginId .. "_uninstall_actions",
                direction = "Horizontal",
                actions = {
                    {
                        label = "Uninstall",
                        action = function()
                            plugin:uninstall(plugin.displayHandle)
                            plugin:dialogAction({
                                type = "ReplaceDialog",
                                dialog = __TS__New(
                                    AlertDialogV2,
                                    plugin,
                                    {
                                        id = pluginId .. "_uninstall",
                                        width = 600,
                                        textHeight = 200,
                                        title = pluginName .. ": Uninstall",
                                        message = "Uninstall completed",
                                        onAction = function()
                                            plugin:dialogAction({type = "PopDialog"})
                                        end
                                    }
                                )
                            })
                        end
                    },
                    {
                        label = "Cancel",
                        action = function()
                            plugin:dialogAction({type = "PopDialog"})
                        end
                    }
                }
            }
        }
    )
end
return ____exports
 end,
["lib.ui.dialogs.ViewButtonInputDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ObjectFactory = require("lib.ObjectFactory")
local ObjectFactory = ____ObjectFactory.ObjectFactory
local ____PoolUtils = require("lib.PoolUtils")
local PoolUtils = ____PoolUtils.PoolUtils
local ____ui = require("lib.ui.index")
local showMessageBox = ____ui.showMessageBox
local ____ConfirmDialog = require("lib.ui.dialogs.ConfirmDialog")
local ConfirmDialog = ____ConfirmDialog.ConfirmDialog
function ____exports.ViewButtonInputDialog(self, options)
    local function show(self, displayHandle)
        local ____options_0 = options
        local title = ____options_0.title
        local message = ____options_0.message
        local onSelected = ____options_0.onSelected
        local selectLabel = ____options_0.selectLabel
        local of = __TS__New(ObjectFactory)
        local screenNumber = displayHandle.index
        local vbs = of:HViewButtonScreen(screenNumber)
        local nextAvailableViewButtonIndex = PoolUtils:findNextEmptyPoolIndex(
            vbs:getObj(),
            1
        )
        local mbOptions = {
            title = title,
            message = message,
            display = displayHandle.index,
            commands = {
                {
                    label = selectLabel,
                    action = function(____, data)
                        local selectedViewButton = {screenNumber = data.inputs.screenNumber, id = data.inputs.viewButtonId}
                        if of:HViewButton(selectedViewButton.screenNumber, selectedViewButton.id):exists() then
                            return {
                                type = "PushDialog",
                                dialog = ConfirmDialog(
                                    nil,
                                    {
                                        title = "Are You sure ?",
                                        message = ((("The view button [" .. tostring(selectedViewButton.screenNumber)) .. ".") .. tostring(selectedViewButton.id)) .. "] is in use.\n\n Shell we overwrite it?",
                                        onConfirmAction = function()
                                            local uiAction = onSelected(nil, selectedViewButton)
                                            local ____uiAction_1 = uiAction
                                            if ____uiAction_1 == nil then
                                                ____uiAction_1 = {type = "PopDialog", numOfDialogsToPop = 2}
                                            end
                                            return ____uiAction_1
                                        end
                                    }
                                )
                            }
                        else
                            local uiAction = onSelected(nil, selectedViewButton)
                            local ____uiAction_2 = uiAction
                            if ____uiAction_2 == nil then
                                ____uiAction_2 = {type = "PopDialog"}
                            end
                            return ____uiAction_2
                        end
                    end
                },
                {
                    type = "abort",
                    label = "Cancel",
                    action = function() return {type = "PopDialog"} end
                }
            },
            inputs = {
                {
                    id = "screenNumber",
                    label = "Screen Number",
                    value = tostring(displayHandle.index),
                    type = "POSITIVE_NUMBER"
                },
                {
                    id = "viewButtonId",
                    label = "View Button Id",
                    value = tostring(nextAvailableViewButtonIndex),
                    type = "POSITIVE_NUMBER"
                }
            }
        }
        return showMessageBox(nil, mbOptions) or ({type = "Quit"})
    end
    return {show = show}
end
return ____exports
 end,
["lib.ui.dialogs.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____ActionDialogV2 = require("lib.ui.dialogs.ActionDialogV2")
    local ActionDialogV2 = ____ActionDialogV2.ActionDialogV2
    ____exports.ActionDialogV2 = ActionDialogV2
end
do
    local ____AlertDialog = require("lib.ui.dialogs.AlertDialog")
    local AlertDialog = ____AlertDialog.AlertDialog
    ____exports.AlertDialog = AlertDialog
end
do
    local ____AlertDialogV2 = require("lib.ui.dialogs.AlertDialogV2")
    local AlertDialogV2 = ____AlertDialogV2.AlertDialogV2
    ____exports.AlertDialogV2 = AlertDialogV2
end
do
    local ____ConfirmDialog = require("lib.ui.dialogs.ConfirmDialog")
    local ConfirmDialog = ____ConfirmDialog.ConfirmDialog
    ____exports.ConfirmDialog = ConfirmDialog
end
do
    local ____FormDialog = require("lib.ui.dialogs.FormDialog")
    local FormDialog = ____FormDialog.FormDialog
    ____exports.FormDialog = FormDialog
end
do
    local ____InputFieldDialog = require("lib.ui.dialogs.InputFieldDialog")
    local InputFieldDialog = ____InputFieldDialog.InputFieldDialog
    ____exports.InputFieldDialog = InputFieldDialog
end
do
    local ____MultiActionDialog = require("lib.ui.dialogs.MultiActionDialog")
    local MultiActionDialog = ____MultiActionDialog.MultiActionDialog
    ____exports.MultiActionDialog = MultiActionDialog
end
do
    local ____SimpleInstanceDialog = require("lib.ui.dialogs.SimpleInstanceDialog")
    local SimpleInstanceDialog = ____SimpleInstanceDialog.SimpleInstanceDialog
    ____exports.SimpleInstanceDialog = SimpleInstanceDialog
end
do
    local ____UninstallDialogV2 = require("lib.ui.dialogs.UninstallDialogV2")
    local UninstallDialogV2 = ____UninstallDialogV2.UninstallDialogV2
    ____exports.UninstallDialogV2 = UninstallDialogV2
end
do
    local ____UserDialogBase = require("lib.ui.dialogs.UserDialogBase")
    local UserDialogBase = ____UserDialogBase.UserDialogBase
    ____exports.UserDialogBase = UserDialogBase
end
do
    local ____ViewButtonInputDialog = require("lib.ui.dialogs.ViewButtonInputDialog")
    local ViewButtonInputDialog = ____ViewButtonInputDialog.ViewButtonInputDialog
    ____exports.ViewButtonInputDialog = ViewButtonInputDialog
end
return ____exports
 end,
["lib.plugin.PluginInstaller"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____AssertUtils = require("lib.AssertUtils")
local AssertUtils = ____AssertUtils.AssertUtils
local ____ObjectFactory = require("lib.ObjectFactory")
local ObjectFactory = ____ObjectFactory.ObjectFactory
local ____Utils = require("lib.Utils")
local getErrorMessage = ____Utils.getErrorMessage
local objectNumOfItems = ____Utils.objectNumOfItems
local ____ImageLibraryAccess = require("lib.image.ImageLibraryAccess")
local ImageLibraryAccess = ____ImageLibraryAccess.ImageLibraryAccess
local ____PluginImageManager = require("lib.plugin.PluginImageManager")
local PluginImageManager = ____PluginImageManager.PluginImageManager
local ____PluginsRegistry = require("lib.plugins.PluginsRegistry.PluginsRegistry")
local PluginsRegistry = ____PluginsRegistry.PluginsRegistry
local ____SubPoolRegistry = require("lib.plugins.SubPoolRegistry.index")
local SubPoolRegistry = ____SubPoolRegistry.SubPoolRegistry
local ____ui = require("lib.ui.index")
local showAlert = ____ui.showAlert
local startUI = ____ui.startUI
local ____dialogs = require("lib.ui.dialogs.index")
local MultiActionDialog = ____dialogs.MultiActionDialog
local ____PluginAssetManager = require("lib.plugin.PluginAssetManager")
local PluginAssetManager = ____PluginAssetManager.PluginAssetManager
local ____PluginConstants = require("lib.plugin.PluginConstants")
local PluginDataAccess = ____PluginConstants.PluginDataAccess
local ____PluginUtils = require("lib.plugin.PluginUtils")
local PluginUtils = ____PluginUtils.PluginUtils
local UNINSTALL_OLD_VERSION = false
____exports.PluginInstaller = __TS__Class()
local PluginInstaller = ____exports.PluginInstaller
PluginInstaller.name = "PluginInstaller"
function PluginInstaller.prototype.____constructor(self, options)
    self.options = options
    local ____options_0 = options
    local pluginEnv = ____options_0.pluginEnv
    local pluginInfo = ____options_0.pluginInfo
    local contextBuilder = ____options_0.contextBuilder
    local _log = ____options_0.log
    self.log = _log:subLogger("Installer")
    self.internalDataAccess = function() return PluginDataAccess(nil, self.pu.pluginId, self.log) end
    local pu = PluginUtils(nil, pluginEnv, pluginInfo)
    self.pu = pu
end
function PluginInstaller.prototype.showAlertDialog(self, title, message)
    showAlert(nil, self.options.displayHandle.index, (self.pu.pluginEnv.pluginName .. ": ") .. title, message)
end
function PluginInstaller.prototype.isInstalled(self)
    return self:internalDataAccess():isDataExists()
end
function PluginInstaller.prototype.install(self, undo, displayHandle, subPoolRegistry, log)
    if self:isInstalled() then
        log:error("Plugin is already installed")
        return {success = false, oldPluginId = nil}
    end
    local pu = self.pu
    local runtime = self:getRuntime()
    local da = self:internalDataAccess():setData({builtInImagesInstalled = false, instances = {}, pluginAssets = {}}):write()
    local of = __TS__New(
        ObjectFactory,
        {
            undoBlock = undo,
            hookManager = runtime:getHookManager(),
            log = log
        }
    )
    of:HPlugin(self.options.pluginInfo.componentHandle:Parent().index):setLocked(true)
    local ____self_options_pluginEnv_1 = self.options.pluginEnv
    local author = ____self_options_pluginEnv_1.author
    local pluginName = ____self_options_pluginEnv_1.pluginName
    local pluginVersion = ____self_options_pluginEnv_1.pluginVersion
    local pluginId = ____self_options_pluginEnv_1.pluginId
    AssertUtils:assertNonEmpty(author, "author")
    AssertUtils:assertNonEmpty(pluginName, "pluginName")
    AssertUtils:assertNonEmpty(pluginVersion, "pluginVersion")
    AssertUtils:assertNonEmpty(pluginId, "pluginId")
    if pu.pluginEnv.env == "prod" then
        local isInStream = self.options.pluginInfo.componentHandle:Get("InStream")
        log:debug("Plugin.install() verify InStream=" .. tostring(isInStream))
        if not isInStream then
            self:showAlertDialog("ALERT !", "We recognized that this plugin was installed in a way which make it:\n\n \"Not InStream\".\n\n\n                    This means that the plugin is not saved with the show file, and may not transfer well to other consoles.\n\n\n                    This may have happend if you put the plugin's file directly under your \"plugins\" folder, and not in the correct path.\n\n                    Please see README.pdf for installation instructions.")
        end
    end
    log:debug("provisionPluginSubPools")
    subPoolRegistry:provisionPluginSubPools(
        pu.pluginEnv:getNameAndVersionAsLabel(),
        self.options.pluginAssetsCapacity
    )
    log:debug(("Hook plugin \"" .. self.options.pluginInfo.pluginObjectName) .. "\"")
    runtime:getHookManager():hook({
        hookId = "__PluginObject",
        obj = of:HPlugin(self.options.pluginInfo.pluginObjectName):getObj(),
        onChange = function(pluginObj, changeLevel)
            if changeLevel == Enums.ChangeLevel.Delete then
                showAlert(nil, displayHandle.index, pluginName .. " - Plugin Uninstall Required !", "Deleting the plugin object is not enough. If you wish to remove all assets created by the plugin, you need to uninstall it using the plugin's own menu.\n\n 1) Please click \"Oops\" to undo the plugin object deletion.\n\n2) Click the plugin object.\n\n 3) Choose \"Uninstall\"\n\n 4) Delete the plugin object")
            end
        end
    })
    local pam = PluginAssetManager(
        nil,
        {
            pluginData = da:getData(),
            log = log,
            of = of,
            subPoolRegistry = subPoolRegistry,
            pu = pu
        }
    )
    local builtInImages = self.options.builtInImages or ({})
    if objectNumOfItems(nil, builtInImages) > 0 then
        local imageManager = PluginImageManager(
            nil,
            {
                pluginData = da:getData(),
                pluginAssetManager = pam:getCommonAssetManager(),
                builtInImages = self.options.builtInImages or ({}),
                pu = pu,
                subPoolRegistry = subPoolRegistry,
                log = log
            }
        )
        imageManager:installBuiltInImages()
    end
    da:write()
    runtime:onInstall()
    return {success = true}
end
function PluginInstaller.prototype.uninstallOldVersion(self, undo, oldPluginId, oldVersion)
    local ____self_options_runtime_2 = self.options.runtime
    local log = ____self_options_runtime_2.log
    local of = __TS__New(
        ObjectFactory,
        {
            undoBlock = undo,
            hookManager = self:getRuntime():getHookManager(),
            log = log
        }
    )
    if oldVersion ~= nil and oldPluginId ~= nil then
        log:info(("Uninstall oldVersion's (" .. oldVersion) .. ") assets:")
        __TS__ArrayForEach(
            __TS__ArrayFilter(
                of:HPool("Plugins"):getObj():Children(),
                function(____, pluginObj)
                    local pluginVersion = of:HPlugin(pluginObj.index):getProps().version
                    return __TS__StringStartsWith(pluginVersion, oldVersion)
                end
            ),
            function(____, pluginObj)
                UnhookMultiple(nil, pluginObj)
                log:info("Delete old plugin object, at index: " .. tostring(pluginObj.index))
                of:HPlugin(pluginObj.index):delete()
            end
        )
        local oldImageAccess = ImageLibraryAccess(nil, oldPluginId, log)
        log:info("Delete old version images from: " .. oldImageAccess.imageLibraryPath)
        ImageLibraryAccess(nil, oldPluginId, log):deleteAllImages()
    end
end
function PluginInstaller.prototype.getOldUserData(self)
    local oldDataDMIndex = self:findOldData()
    if oldDataDMIndex == nil then
        return nil
    else
        local dms = self.options.dataMigrations
        local oldPluginId = dms[oldDataDMIndex + 1].fromPluginId
        local oldVersion = dms[oldDataDMIndex + 1].fromVersion
        self.log:info("Found an old version " .. oldVersion)
        return {
            userData = self:migrateOldData(oldDataDMIndex),
            oldPluginId = oldPluginId,
            oldVersion = oldVersion
        }
    end
end
function PluginInstaller.prototype.getOldUserDataWithDialogV1(self)
    local oldDataDMIndex = self:findOldData()
    local userData
    if oldDataDMIndex ~= nil then
        local dms = self.options.dataMigrations
        local oldPluginId = dms[oldDataDMIndex + 1].fromPluginId
        local oldVersion = dms[oldDataDMIndex + 1].fromVersion
        self.log:info("Found an old version " .. oldVersion)
        userData = startUI(
            nil,
            self.options.displayHandle,
            MultiActionDialog(
                nil,
                {
                    title = "Version Update",
                    message = ("An old version (" .. self.options.dataMigrations[oldDataDMIndex + 1].fromVersion) .. ") was found.\n\nDo you want to IMPORT the user data from the old version?\n\n Or CREATE NEW initial user data?",
                    actions = {
                        {
                            label = "IMPORT",
                            action = function()
                                return {
                                    type = "Quit",
                                    returnValue = {
                                        userData = self:migrateOldData(oldDataDMIndex),
                                        oldPluginId = oldPluginId,
                                        oldVersion = oldVersion
                                    }
                                }
                            end
                        },
                        {
                            label = "CREATE NEW",
                            action = function()
                                return {type = "Quit", returnValue = nil}
                            end
                        }
                    }
                }
            )
        )
    end
    return userData
end
function PluginInstaller.prototype.findOldData(self)
    local dms = self.options.dataMigrations
    local i
    if #dms == 0 then
        return
    end
    if self.pu.pluginEnv.env == "dev" then
        local lastDm = dms[#dms]
        if lastDm.toPluginId .. "_dev" == self.pu.pluginEnv.pluginId then
            lastDm.toPluginId = self.pu.pluginEnv.pluginId
        end
    end
    if dms[#dms].toPluginId ~= self.pu.pluginId then
        error((("DataMigration's last item's toPluginId differs from the current pluginId. dm:" .. dms[#dms].toPluginId) .. ", cur:") .. self.pu.pluginId)
    end
    do
        i = #dms - 1
        while i >= 0 do
            local dm = dms[i + 1]
            local oldDataAccess = PluginDataAccess(nil, dm.fromPluginId, self.log)
            if oldDataAccess:isDataExists() then
                return i
            end
            i = i - 1
        end
    end
end
function PluginInstaller.prototype.migrateOldData(self, fromDMIndex)
    local dms = self.options.dataMigrations
    local firstDM = dms[fromDMIndex + 1]
    local dataAccess = PluginDataAccess(nil, firstDM.fromPluginId, self.log)
    assert(dataAccess:read())
    local j = fromDMIndex
    local userData = dataAccess:getData().userData
    repeat
        do
            userData = dms[j + 1]:migrateUserData(userData)
            j = j + 1
        end
    until not (j < #dms)
    return userData
end
function PluginInstaller.prototype.getRuntime(self)
    return self.options.runtime
end
function PluginInstaller.prototype.uninstall(self, undo, displayHandle, log, hardCleanup)
    local pu = self.pu
    local ____pu_3 = pu
    local pluginId = ____pu_3.pluginId
    log:info((("uninstall(): pluginId=" .. self.pu.pluginId) .. " hardCleanup=") .. tostring(hardCleanup))
    local spda = self.options.runtime.pluginRegistry:getOrInitSubPoolRegistryDataAccess()
    local subPoolRegistryData = spda
    local da = PluginDataAccess(nil, self.pu.pluginId, self.log)
    if not hardCleanup then
        local dataReadSuccesfuly = da:read()
        if not dataReadSuccesfuly then
            log:error("uninstall(): failed to read data. deleting data.")
            self:internalDataAccess():cleanUp()
            return
        end
    end
    do
        local function ____catch(err)
            log:error("uninstall(): pluginRuntime.cleanup() error. Continuing uninstall. " .. getErrorMessage(nil, err))
        end
        local ____try, ____hasReturned = pcall(function()
            log:trace("uninstall: Delete Hooks")
            local pluginRuntime = self:getRuntime()
            pluginRuntime:cleanupHooks()
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    if not hardCleanup then
        local pluginContext = self.options.contextBuilder:buildPluginContext(
            da:getData(),
            undo,
            subPoolRegistryData,
            log
        )
        local instanceManager = pluginContext.instanceManager
        do
            local function ____catch(err)
                log:error("uninstall(): plugin specific uninstall error: " .. getErrorMessage(nil, err))
            end
            local ____try, ____hasReturned = pcall(function()
                log:trace("uninstall: Call plugin uninstall")
                __TS__ArrayForEach(
                    instanceManager:getInstanceIds(),
                    function(____, instanceId)
                        self.options:onInstanceDelete(pluginContext, instanceId)
                    end
                )
                self.options:onUninstall(
                    da:getData(),
                    undo,
                    displayHandle,
                    spda,
                    log
                )
                da:write()
                spda:write()
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    do
        local function ____catch(err)
            log:error("uninstall(): error deleting plugin assets: " .. getErrorMessage(nil, err))
        end
        local ____try, ____hasReturned = pcall(function()
            local of = ObjectFactory.noContext
            log:trace("uninstall: Clean AssetManager")
            PluginAssetManager(
                nil,
                {
                    pluginData = da:getData(),
                    log = log,
                    of = of,
                    subPoolRegistry = __TS__New(SubPoolRegistry, {
                        eventEmitter = self.options.runtime.pluginRegistry.eventDispatcher,
                        pluginId = pluginId,
                        data = subPoolRegistryData,
                        log = log,
                        readOnly = true
                    }),
                    pu = pu
                }
            ):deleteAll(undo)
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    if not hardCleanup then
        do
            local function ____catch(err)
                log:error("uninstall(): error deleting instances assets: " .. getErrorMessage(nil, err))
            end
            local ____try, ____hasReturned = pcall(function()
                local pluginContext = self.options.contextBuilder:buildPluginContext(
                    da:getData(),
                    undo,
                    subPoolRegistryData,
                    log
                )
                local instanceManager = pluginContext.instanceManager
                log:trace("uninstall: clean InstanceManager")
                instanceManager:deleteAll()
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    do
        local function ____catch(err)
            log:error("uninstall(): error uninstalling images: " .. getErrorMessage(nil, err))
        end
        local ____try, ____hasReturned = pcall(function()
            log:trace("uninstall: uninstall images")
            local imageAccess = ImageLibraryAccess(nil, self.pu.pluginId, log)
            imageAccess:deleteAllImages()
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    do
        local function ____catch(err)
            log:error("uninstall(): error uninstalling images: " .. getErrorMessage(nil, err))
        end
        local ____try, ____hasReturned = pcall(function()
            log:trace("uninstall: Delete Own Sub-Pools from registry")
            local registry = __TS__New(SubPoolRegistry, {
                eventEmitter = self.options.runtime.pluginRegistry.eventDispatcher,
                pluginId = pluginId,
                data = subPoolRegistryData,
                log = log,
                readOnly = false
            })
            local of = ObjectFactory.noContext
            __TS__ArrayForEach(
                registry:getAllInternalSubPools(),
                function(____, subPoolWrapper)
                    local ____subPoolWrapper_4 = subPoolWrapper
                    local range = ____subPoolWrapper_4.range
                    local poolId = ____subPoolWrapper_4.poolId
                    local pool = of:HPool(poolId)
                    if not pool:isRangeEmpty(range) then
                        pool:deleteRange(range, {noConfirm = true})
                    end
                end
            )
            registry:disassociateAllSubPools()
            if registry:isEmpty() then
                spda:cleanUp()
            else
                spda:write()
            end
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    self:getRuntime():destroy()
    if PluginsRegistry:exists() then
        local pluginRegistry = PluginsRegistry:get()
        log:trace("Emitting \"subPoolsChange\"")
        pluginRegistry.eventDispatcher:emit({eventName = "subPoolsChange", displayHandle = displayHandle, pluginId = pluginId})
        pluginRegistry:unregister(pluginId)
    end
    do
        local function ____catch(err)
            log:error("uninstall(): error deleting data variable: " .. getErrorMessage(nil, err))
        end
        local ____try, ____hasReturned = pcall(function()
            log:trace("uninstall: Delete data variable")
            da:cleanUp()
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    local of = ObjectFactory.noContext
    of:HPlugin(self.options.pluginInfo.componentHandle:Parent().index):setLocked(false)
end
return ____exports
 end,
["lib.plugins.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____export = require("lib.plugins.PluginsRegistry.PluginsRegistry")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lib.ui.DialogStack"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local nTimes = ____Utils.nTimes
____exports.DialogStack = __TS__Class()
local DialogStack = ____exports.DialogStack
DialogStack.name = "DialogStack"
function DialogStack.prototype.____constructor(self, log)
    self.dialogStack = {}
    self.log = log:subLogger("DialogStack")
end
function DialogStack.prototype.newStack(self, _display, dialog)
    self.dialogStack = {dialog}
    self.display = _display
    dialog:show(_display)
end
function DialogStack.prototype.action(self, uiAction)
    if self.display == nil then
        error("DialogStack not initialized")
    end
    local curDialog = self.dialogStack[#self.dialogStack]
    curDialog:close()
    self:updateStack(uiAction)
    self:showFrontDialog()
end
function DialogStack.prototype.showFrontDialog(self)
    if self.display == nil then
        error("DialogStack not initialized")
    end
    local selfDisplay = self.display
    if #self.dialogStack > 0 then
        self.log:trace("action() show front dialog")
        self.dialogStack[#self.dialogStack]:show(selfDisplay)
    else
        self.log:trace("action() stack is empty")
        self.display = nil
    end
end
function DialogStack.prototype.updateStack(self, uiAction)
    self.log:trace("UIAction: " .. uiAction.type)
    repeat
        local ____switch11 = uiAction.type
        local ____cond11 = ____switch11 == "Quit"
        if ____cond11 then
            do
                self.dialogStack = {}
                self.display = nil
                break
            end
        end
        ____cond11 = ____cond11 or ____switch11 == "PushDialog"
        if ____cond11 then
            do
                if uiAction.type == "PushDialog" then
                    local ____self_dialogStack_0 = self.dialogStack
                    ____self_dialogStack_0[#____self_dialogStack_0 + 1] = uiAction.dialog
                end
                break
            end
        end
        ____cond11 = ____cond11 or ____switch11 == "PopDialog"
        if ____cond11 then
            do
                nTimes(
                    nil,
                    uiAction.numOfDialogsToPop or 1,
                    function()
                        table.remove(self.dialogStack)
                    end
                )
                break
            end
        end
        ____cond11 = ____cond11 or ____switch11 == "ReplaceDialog"
        if ____cond11 then
            do
                table.remove(self.dialogStack)
                local ____self_dialogStack_1 = self.dialogStack
                ____self_dialogStack_1[#____self_dialogStack_1 + 1] = uiAction.dialog
                break
            end
        end
        ____cond11 = ____cond11 or ____switch11 == "RefreshDialog"
        if ____cond11 then
            do
                break
            end
        end
    until true
end
return ____exports
 end,
["lib.plugin.PluginExternalActionRegistry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.PluginExternalActionRegistry = __TS__Class()
local PluginExternalActionRegistry = ____exports.PluginExternalActionRegistry
PluginExternalActionRegistry.name = "PluginExternalActionRegistry"
function PluginExternalActionRegistry.prototype.____constructor(self, log)
    self.log = log
    self.handlers = {}
end
function PluginExternalActionRegistry.prototype.registerHandler(self, actionType, handler)
    self.handlers[actionType] = handler
end
function PluginExternalActionRegistry.prototype.getHandler(self, actionType)
    return self.handlers[actionType]
end
return ____exports
 end,
["lib.plugin.PluginStatelessComponents"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Logger = require("lib.Logger")
local Logger = ____Logger.Logger
local ____Utils = require("lib.Utils")
local typed = ____Utils.typed
local ____PluginExternalActionRegistry = require("lib.plugin.PluginExternalActionRegistry")
local PluginExternalActionRegistry = ____PluginExternalActionRegistry.PluginExternalActionRegistry
--- A Singleton in the LUA global space, that hold statless plugin components.
-- These components can hold constants, or components that register on LUA load time (before main is called).
-- I doesn't matter if another show is loaded. It would be nice to clean them up, 
-- but not necessary since they don't hold any state of the plugin.
____exports.PluginStatelessComponents = __TS__Class()
local PluginStatelessComponents = ____exports.PluginStatelessComponents
PluginStatelessComponents.name = "PluginStatelessComponents"
function PluginStatelessComponents.prototype.____constructor(self, log)
    self.log = log
    self.externalActionRegistry = __TS__New(PluginExternalActionRegistry, log)
end
function PluginStatelessComponents.GET_OR_CREATE(self, pluginId)
    local id = pluginId .. "_stateless"
    if typed(nil, _G)[id] == nil then
        typed(nil, _G)[id] = __TS__New(
            ____exports.PluginStatelessComponents,
            Logger(nil, {prefix = {id}})
        )
    end
    return typed(nil, _G)[id]
end
return ____exports
 end,
["lib.plugin.PluginRuntime"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____HookManager = require("lib.HookManager")
local HookManager = ____HookManager.HookManager
local ____Logger = require("lib.Logger")
local Logger = ____Logger.Logger
local LogLevel = ____Logger.LogLevel
local ____MAVariables = require("lib.MAVariables")
local MAVariables = ____MAVariables.MAVariables
local ____plugins = require("lib.plugins.index")
local PluginsRegistry = ____plugins.PluginsRegistry
local ____DialogStack = require("lib.ui.DialogStack")
local DialogStack = ____DialogStack.DialogStack
local ____Utils = require("lib.Utils")
local objectValues = ____Utils.objectValues
local withDefault = ____Utils.withDefault
local ____uuid = require("lib.uuid")
local genUuid = ____uuid.gen
local ____MutexFactory = require("lib.MutexFactory.MutexFactory")
local MutexFactory = ____MutexFactory.MutexFactory
local ____PluginConstants = require("lib.plugin.PluginConstants")
local PluginDataAccess = ____PluginConstants.PluginDataAccess
local ____PluginStatelessComponents = require("lib.plugin.PluginStatelessComponents")
local PluginStatelessComponents = ____PluginStatelessComponents.PluginStatelessComponents
--- Runtime objects (PluginRuntime and InstanceRuntime) are objects that persist between plugin events.
-- They are stored in the Global LUA space.
-- They perish when MA3 is shutdown.
-- When a new show is loaded, they should also be destroyed.
-- For now we don't haave a proper listening on showLoad event, so we lazily destroy it when it is accessed for the first time.
-- This is done by writing the runtime's uuid in the ShowData AddonVars.
local GlobalVariable = _G
____exports.PluginRuntime = __TS__Class()
local PluginRuntime = ____exports.PluginRuntime
PluginRuntime.name = "PluginRuntime"
function PluginRuntime.prototype.____constructor(self, params)
    self.params = params
    local ____params_0 = params
    local pluginId = ____params_0.pluginId
    local pluginEnv = ____params_0.pluginEnv
    local pluginInfo = ____params_0.pluginInfo
    local logLevel = ____params_0.logLevel
    self.logLevel = withDefault(nil, logLevel, pluginEnv.env == "prod" and LogLevel.ERROR or LogLevel.TRACE)
    local rootLog = Logger(nil, {prefix = {pluginId}, logLevel = self.logLevel})
    self.rootLog = rootLog
    local log = rootLog:subLogger("RunTime")
    local uuid = genUuid(nil)
    local pluginRegistry = PluginsRegistry:getOrCreate()
    local mutexFactory = MutexFactory(
        nil,
        rootLog:subLogger("MutexFactory")
    )
    self.mutexFactory = mutexFactory
    log:trace("constructor() uuid=" .. uuid)
    self.runtime_uuid = uuid
    self.pluginId = pluginId
    self.__pluginHooksManager = HookManager(
        nil,
        {
            id = "plugin",
            pluginHandle = pluginInfo.componentHandle:Parent(),
            parentLog = rootLog:subLogger("Plugin:HookManager"),
            mutexFactory = mutexFactory
        }
    )
    self.__instances = {}
    self.pluginInfo = pluginInfo
    self.log = log
    self.pluginRegistry = pluginRegistry
    self.registryEventListener = function(____, event)
        self.log:trace("Runtime: on('subPoolsChange'): event.pluginId=" .. event.pluginId)
        if PluginDataAccess(nil, self.pluginId, self.log):isDataExists() and event.pluginId ~= self.pluginId then
            self:onPluginRegistryEvent(event)
        end
    end
    self.dialogStack = __TS__New(DialogStack, self.log)
    self.dataAccess = PluginDataAccess(nil, pluginId, rootLog)
end
function PluginRuntime.prototype.update(self, pluginInfo)
    self.pluginInfo = pluginInfo
end
function PluginRuntime.prototype.getRuntimeId(self)
    return self.runtime_uuid
end
function PluginRuntime.prototype.initPluginsRegistryEventListener(self)
    local pluginRegistry = PluginsRegistry:getOrCreate()
    self.cleanEventListener = pluginRegistry.events:on("subPoolsChange", self.registryEventListener)
end
function PluginRuntime.prototype.getLogLevel(self)
    return self.logLevel
end
function PluginRuntime.prototype.setLogLevel(self, level)
    self.logLevel = level
    self.rootLog:setLogLevel(level)
    self.pluginRegistry:setLogLevel(level)
end
function PluginRuntime.prototype.getHookManager(self)
    return self.__pluginHooksManager
end
function PluginRuntime.prototype.getExtActionHandler(self, actionType)
    return PluginStatelessComponents:GET_OR_CREATE(self.pluginId).externalActionRegistry:getHandler(actionType)
end
function PluginRuntime.prototype.getOrCreateInstanceRuntime(self, instanceId)
    local instanceRuntime = self.__instances[instanceId]
    if instanceRuntime == nil then
        instanceRuntime = self:createInstanceRuntime(instanceId, self.pluginInfo, self.rootLog, self)
        self.__instances[instanceId] = instanceRuntime
    end
    return instanceRuntime
end
function PluginRuntime.prototype.deleteInstanceRuntime(self, instanceId)
    local instanceRuntime = self.__instances[instanceId]
    if instanceRuntime ~= nil then
        instanceRuntime:cleanUp()
    end
    __TS__Delete(self.__instances, instanceId)
end
function PluginRuntime.prototype.cleanupHooks(self)
    self.__pluginHooksManager:cleanup()
    for ____, instanceRuntime in ipairs(objectValues(nil, self.__instances)) do
        instanceRuntime:getHookManager():cleanup()
    end
end
function PluginRuntime.prototype.onInstall(self)
    self.log:trace("onInstall()")
    local ____self_params_1 = self.params
    local pluginEnv = ____self_params_1.pluginEnv
    local pluginInfo = ____self_params_1.pluginInfo
    self.pluginRegistry:register(pluginEnv, pluginInfo)
    self:initPluginsRegistryEventListener()
end
function PluginRuntime.prototype.destroy(self)
    self.log:trace("destroy() uuid=" .. self.runtime_uuid)
    for ____, instanceRuntime in ipairs(objectValues(nil, self.__instances)) do
        instanceRuntime:cleanUp()
    end
    self.__pluginHooksManager:cleanup()
    local ____ = self.cleanEventListener and self:cleanEventListener()
    self.pluginRegistry:unregister(self.pluginId)
    __TS__Delete(GlobalVariable, self.pluginId)
    self.mutexFactory:cleanup()
end
local RUNTIME_UUID_VAR_NAME = "RUNTIME_UUID"
function ____exports.getOrCreateRuntime(self, pluginId, pluginInfo, create)
    local pluginAddonVars = MAVariables(nil, {storageType = "ShowFile", variablesId = pluginId})
    local function createRuntime(self)
        local runtime = create(nil)
        pluginAddonVars:setVar(
            RUNTIME_UUID_VAR_NAME,
            runtime:getRuntimeId()
        )
        return runtime
    end
    if GlobalVariable[pluginId] == nil then
        GlobalVariable[pluginId] = createRuntime(nil)
    else
        local runtime = GlobalVariable[pluginId]
        if pluginAddonVars:getVar(RUNTIME_UUID_VAR_NAME) ~= runtime:getRuntimeId() then
            runtime:destroy()
            GlobalVariable[pluginId] = createRuntime(nil)
        end
    end
    local runtime = GlobalVariable[pluginId]
    pluginInfo.pluginObjectName = pluginInfo.componentHandle:Parent().name
    runtime:update(pluginInfo)
    return runtime
end
return ____exports
 end,
["lib.uuid"] = function(...) 
---------------------------------------------------------------------------------------
-- Copyright 2012 Rackspace (original), 2013-2021 Thijs Schreijer (modifications)
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless requireXXXd by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS-IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- see http://www.ietf.org/rfc/rfc4122.txt
--
-- Note that this is not a true version 4 (random) UUID.  Since `os.time()` precision is only 1 second, it would be hard
-- to guarantee spacial uniqueness when two hosts generate a uuid after being seeded during the same second.  This
-- is solved by using the node field from a version 1 UUID.  It represents the mac address.
--
-- 28-apr-2013 modified by Thijs Schreijer from the original [Rackspace code](https://github.com/kans/zirgo/blob/807250b1af6725bad4776c931c89a784c1e34db2/util/uuid.lua) as a generic Lua module.
-- Regarding the above mention on `os.time()`; the modifications use the `socket.gettime()` function from LuaSocket
-- if available and hence reduce that problem (provided LuaSocket has been loaded before uuid).
--
-- **Important:** the random seed is a global piece of data. Hence setting it is
-- an application level responsibility, libraries should never set it!
--
-- See this issue; [https://github.com/Kong/kong/issues/478](https://github.com/Kong/kong/issues/478)
-- It demonstrates the problem of using time as a random seed. Specifically when used from multiple processes.
-- So make sure to seed only once, application wide. And to not have multiple processes do that
-- simultaneously.
local M = {}
-- local math = requireXXX('math')
-- local os = requireXXX('os')
-- local string = requireXXX('string')

local bitsize = 32 -- bitsize assumed for Lua VM. See randomseed function below.
local lua_version = tonumber(_VERSION:match("%d%.*%d*")) -- grab Lua version used

local MATRIX_AND = {{0, 0}, {0, 1}}
local MATRIX_OR = {{0, 1}, {1, 1}}
local HEXES = '0123456789abcdef'

local math_floor = math.floor
local math_random = math.random
local math_abs = math.abs
local string_sub = string.sub
local to_number = tonumber
local assert = assert
local type = type

-- performs the bitwise operation specified by truth matrix on two numbers.
local function BITWISE(x, y, matrix)
    local z = 0
    local pow = 1
    while x > 0 or y > 0 do
        z = z + (matrix[x % 2 + 1][y % 2 + 1] * pow)
        pow = pow * 2
        x = math_floor(x / 2)
        y = math_floor(y / 2)
    end
    return z
end

local function INT2HEX(x)
    local s, base = '', 16
    local d
    while x > 0 do
        d = x % base + 1
        x = math_floor(x / base)
        s = string_sub(HEXES, d, d) .. s
    end
    while #s < 2 do
        s = "0" .. s
    end
    return s
end

----------------------------------------------------------------------------
-- Creates a new uuid. Either provide a unique hex string, or make sure the
-- random seed is properly set. The module table itself is a shortcut to this
-- function, so `my_uuid = uuid.new()` equals `my_uuid = uuid()`.
--
-- For proper use there are 3 options;
--
-- 1. first requireXXX `luasocket`, then call `uuid.seed()`, and request a uuid using no
-- parameter, eg. `my_uuid = uuid()`
-- 2. use `uuid` without `luasocket`, set a random seed using `uuid.randomseed(some_good_seed)`,
-- and request a uuid using no parameter, eg. `my_uuid = uuid()`
-- 3. use `uuid` without `luasocket`, and request a uuid using an unique hex string,
-- eg. `my_uuid = uuid(my_networkcard_macaddress)`
--
-- @return a properly formatted uuid string
-- @param hwaddr (optional) string containing a unique hex value (e.g.: `00:0c:29:69:41:c6`), to be used to compensate for the lesser `math_random()` function. Use a mac address for solid results. If omitted, a fully randomized uuid will be generated, but then you must ensure that the random seed is set properly!
-- @usage
-- local uuid = requireXXX("uuid")
-- print("here's a new uuid: ",uuid())
function M.gen(hwaddr)
    -- bytes are treated as 8bit unsigned bytes.
    local bytes = {
        math_random(0, 255), math_random(0, 255), math_random(0, 255),
        math_random(0, 255), math_random(0, 255), math_random(0, 255),
        math_random(0, 255), math_random(0, 255), math_random(0, 255),
        math_random(0, 255), math_random(0, 255), math_random(0, 255),
        math_random(0, 255), math_random(0, 255), math_random(0, 255),
        math_random(0, 255)
    }

    if hwaddr then
        assert(type(hwaddr) == "string",
               "Expected hex string, got " .. type(hwaddr))
        -- Cleanup provided string, assume mac address, so start from back and cleanup until we've got 12 characters
        local i, str = #hwaddr, hwaddr
        hwaddr = ""
        while i > 0 and #hwaddr < 12 do
            local c = str:sub(i, i):lower()
            if HEXES:find(c, 1, true) then
                -- valid HEX character, so append it
                hwaddr = c .. hwaddr
            end
            i = i - 1
        end
        assert(#hwaddr == 12,
               "Provided string did not contain at least 12 hex characters, retrieved '" ..
                   hwaddr .. "' from '" .. str .. "'")

        -- no split() in lua. :(
        bytes[11] = to_number(hwaddr:sub(1, 2), 16)
        bytes[12] = to_number(hwaddr:sub(3, 4), 16)
        bytes[13] = to_number(hwaddr:sub(5, 6), 16)
        bytes[14] = to_number(hwaddr:sub(7, 8), 16)
        bytes[15] = to_number(hwaddr:sub(9, 10), 16)
        bytes[16] = to_number(hwaddr:sub(11, 12), 16)
    end

    -- set the version
    bytes[7] = BITWISE(bytes[7], 0x0f, MATRIX_AND)
    bytes[7] = BITWISE(bytes[7], 0x40, MATRIX_OR)
    -- set the variant
    bytes[9] = BITWISE(bytes[9], 0x3f, MATRIX_AND)
    bytes[9] = BITWISE(bytes[9], 0x80, MATRIX_OR)
    return INT2HEX(bytes[1]) .. INT2HEX(bytes[2]) .. INT2HEX(bytes[3]) ..
               INT2HEX(bytes[4]) .. "-" .. INT2HEX(bytes[5]) ..
               INT2HEX(bytes[6]) .. "-" .. INT2HEX(bytes[7]) ..
               INT2HEX(bytes[8]) .. "-" .. INT2HEX(bytes[9]) ..
               INT2HEX(bytes[10]) .. "-" .. INT2HEX(bytes[11]) ..
               INT2HEX(bytes[12]) .. INT2HEX(bytes[13]) .. INT2HEX(bytes[14]) ..
               INT2HEX(bytes[15]) .. INT2HEX(bytes[16])
end

----------------------------------------------------------------------------
-- Improved randomseed function.
-- Lua 5.1 and 5.2 both truncate the seed given if it exceeds the integer
-- range. If this happens, the seed will be 0 or 1 and all randomness will
-- be gone (each application run will generate the same sequence of random
-- numbers in that case). This improved version drops the most significant
-- bits in those cases to get the seed within the proper range again.
-- @param seed the random seed to set (integer from 0 - 2^32, negative values will be made positive)
-- @return the (potentially modified) seed used
-- @usage
-- local socket = requireXXX("socket")  -- gettime() has higher precision than os.time()
-- local uuid = requireXXX("uuid")
-- -- see also example at uuid.seed()
-- uuid.randomseed(socket.gettime()*10000)
-- print("here's a new uuid: ",uuid())
function M.randomseed(seed)
    seed = math_floor(math_abs(seed))
    if seed >= (2 ^ bitsize) then
        -- integer overflow, so reduce to prevent a bad seed
        seed = seed - math_floor(seed / 2 ^ bitsize) * (2 ^ bitsize)
    end
    if lua_version < 5.2 then
        -- 5.1 uses (incorrect) signed int
        math.randomseed(seed - 2 ^ (bitsize - 1))
    else
        -- 5.2 uses (correct) unsigned int
        math.randomseed(seed)
    end
    return seed
end

----------------------------------------------------------------------------
-- Seeds the random generator.
-- It does so in 3 possible ways;
--
-- 1. if in ngx_lua, use `ngx.time() + ngx.worker.pid()` to ensure a unique seed
-- for each worker. It should ideally be called from the `init_worker` context.
-- 2. use luasocket `gettime()` function, but it only does so when LuaSocket
-- has been requireXXXd already.
-- 3. use `os.time()`: this only offers resolution to one second (used when
-- LuaSocket hasn't been loaded)
--
-- **Important:** the random seed is a global piece of data. Hence setting it is
-- an application level responsibility, libraries should never set it!
-- @usage
-- local socket = requireXXX("socket")  -- gettime() has higher precision than os.time()
-- -- LuaSocket loaded, so below line does the same as the example from randomseed()
-- uuid.seed()
-- print("here's a new uuid: ",uuid())
function M.seed()
    if _G.ngx ~= nil then
        return M.randomseed(ngx.time() + ngx.worker.pid())
    elseif package.loaded["socket"] and package.loaded["socket"].gettime then
        return M.randomseed(package.loaded["socket"].gettime() * 10000)
    else
        return M.randomseed(os.time())
    end
end

return setmetatable(M, {
    __call = function(self, hwaddr)
        return self.gen(hwaddr)
    end
})
 end,
["lib.plugin.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____export = require("lib.plugin.AssetManager")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.ContextBuilderBase")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.EventProviders")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.ExternalActionCommandFactory")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.InstanceRuntimeBase")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginAssetManager")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginBase")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginConstants")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginEnv")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginEventHandler")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginEventHooks")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginImageManager")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginInstaller")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginInstanceManager")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginRuntime")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugin.PluginUtils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lib.plugins.SubPoolRegistry.types.SubPoolRegistryData"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.plugins.SubPoolRegistry.types.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.SocketMutex"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____socket = require("socket")
local bind = ____socket.bind
____exports.SocketMutex = __TS__Class()
local SocketMutex = ____exports.SocketMutex
SocketMutex.name = "SocketMutex"
function SocketMutex.prototype.____constructor(self, port, log)
    self.port = port
    self.isAlive = true
    self.log = log:subLogger(("SocketMutex(port=" .. tostring(port)) .. ")")
end
function SocketMutex.prototype.isLocked(self)
    return self._socket ~= nil
end
function SocketMutex.prototype.tryLock(self)
    if not self.isAlive then
        return false
    end
    local socket = bind("*", self.port)
    if socket ~= nil then
        self._socket = socket
        return true
    else
        return false
    end
end
function SocketMutex.prototype.lock(self)
    if not self.isAlive then
        return false
    end
    local socket
    local ts = os.time()
    repeat
        do
            socket = bind("*", self.port)
            if socket ~= nil then
                self.log:trace("Locked")
                self._socket = socket
                return true
            else
                self.log:trace("Yield - wait for unlock")
                coroutine.yield()
            end
            if os.time() - ts > 2 then
                self:destroy()
                error(self.log:msg("Deadlock Detected - destroyed mutex"))
            end
        end
    until not (self.isAlive and socket == nil)
end
function SocketMutex.prototype.unlock(self)
    if self._socket ~= nil then
        local tempSocket = self._socket
        self._socket = nil
        tempSocket:close()
        self.log:trace("UnLocked")
    end
end
function SocketMutex.prototype.destroy(self)
    if self._socket ~= nil then
        self.log:trace("Destroy: closing socket")
        self._socket:close()
        self._socket = nil
        self.isAlive = false
    end
    self.log:trace("Destroy: mutex was not locked")
end
return ____exports
 end,
["lib.plugins.SocketMutexRegistry.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.plugins.SocketMutexRegistry.SocketMutexRegistry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____SocketMutex = require("lib.SocketMutex")
local SocketMutex = ____SocketMutex.SocketMutex
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local objectValues = ____Utils.objectValues
local PLUGIN_SOCKET_MUTEX_START_PORT = 9520
local PORT_RANGE = 1000
____exports.SocketMutexRegistry = __TS__Class()
local SocketMutexRegistry = ____exports.SocketMutexRegistry
SocketMutexRegistry.name = "SocketMutexRegistry"
function SocketMutexRegistry.prototype.____constructor(self)
    self.consumers = {}
end
function SocketMutexRegistry.prototype.consumer(self, consumerId, log)
    self.consumers[consumerId] = {}
    local function provisionOrGet(____, mutexId)
        if self.consumers[consumerId] ~= nil and self.consumers[consumerId][mutexId] ~= nil then
            return self.consumers[consumerId][mutexId]
        end
        do
            local port = PLUGIN_SOCKET_MUTEX_START_PORT
            while port < PLUGIN_SOCKET_MUTEX_START_PORT + PORT_RANGE do
                if not self:isPortProvisioned(port) then
                    local mutex = __TS__New(SocketMutex, port, log)
                    if mutex:tryLock() then
                        mutex:unlock()
                        local consumerMutexes = self.consumers[consumerId]
                        if consumerMutexes == nil then
                            consumerMutexes = {}
                            self.consumers[consumerId] = consumerMutexes
                        end
                        consumerMutexes[mutexId] = mutex
                        log:trace(((((("SocketMutexRegistry.provision(" .. consumerId) .. ",") .. mutexId) .. "): found port ") .. tostring(port)) .. " for SocketMutex")
                        return mutex
                    end
                end
                port = port + 1
            end
        end
        error(("SocketMutexRegistry.provision(): mutex capacity of " .. tostring(PORT_RANGE)) .. " exceeded")
    end
    return {provisionOrGet = provisionOrGet}
end
function SocketMutexRegistry.prototype.isPortProvisioned(self, port)
    for ____, consumer in ipairs(objectValues(nil, self.consumers)) do
        if __TS__ArrayFind(
            objectValues(nil, consumer),
            function(____, m) return m.port == port end
        ) ~= nil then
            return true
        end
    end
    return false
end
function SocketMutexRegistry.prototype.cleanup(self, consumerId)
    if self.consumers[consumerId] ~= nil then
        for ____, mutex in ipairs(objectValues(nil, self.consumers[consumerId])) do
            mutex:destroy()
        end
        __TS__Delete(self.consumers, consumerId)
    end
end
function SocketMutexRegistry.prototype.destroy(self)
    for ____, consumerId in ipairs(objectKeys(nil, self.consumers)) do
        self:cleanup(consumerId)
    end
end
return ____exports
 end,
["lib.plugins.PluginsRegistry.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.plugins.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["plugins.PoolBrowser.src.data.common"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.READ_ONLY_MSG = "Attempt to mutate a readonly DataWrapper"
function ____exports.getPrevOrNextAssignedItem(self, itemNumber, itemArray, isEmpty)
    do
        local _itemNumber = itemNumber
        while _itemNumber >= 1 do
            if not isEmpty(nil, itemArray[_itemNumber]) then
                return _itemNumber
            end
            _itemNumber = _itemNumber - 1
        end
    end
    do
        local _itemNumber = itemNumber
        while _itemNumber <= #itemArray do
            if not isEmpty(nil, itemArray[_itemNumber]) then
                return _itemNumber
            end
            _itemNumber = _itemNumber + 1
        end
    end
end
return ____exports
 end,
["lib.plugins.SubPoolRegistry.SubPoolWrapper"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____RangeUtils = require("lib.RangeUtils")
local RangeUtils = ____RangeUtils.RangeUtils
local ____common = require("plugins.PoolBrowser.src.data.common")
local READ_ONLY_MSG = ____common.READ_ONLY_MSG
____exports.SubPoolWrapper = __TS__Class()
local SubPoolWrapper = ____exports.SubPoolWrapper
SubPoolWrapper.name = "SubPoolWrapper"
function SubPoolWrapper.prototype.____constructor(self, params)
    self.params = params
    self.registry = params.registry
    self.poolWrapper = params.poolWrapper
    self.poolId = params.poolId
    self.subPoolData = params.subPoolData
    self.subPoolId = params.subPoolId
    self.log = params.log
    self.readOnly = params.readOnly
end
__TS__SetDescriptor(
    SubPoolWrapper.prototype,
    "id",
    {get = function(self)
        return self.subPoolId
    end},
    true
)
__TS__SetDescriptor(
    SubPoolWrapper.prototype,
    "name",
    {get = function(self)
        return self.subPoolData.name
    end},
    true
)
__TS__SetDescriptor(
    SubPoolWrapper.prototype,
    "range",
    {get = function(self)
        return self.subPoolData.range
    end},
    true
)
__TS__SetDescriptor(
    SubPoolWrapper.prototype,
    "pluginIds",
    {get = function(self)
        return self.subPoolData.pluginIds
    end},
    true
)
function SubPoolWrapper.prototype.setDirty(self)
    self.registry:setDirty()
end
function SubPoolWrapper.prototype.isInternal(self)
    return self.subPoolData.internal
end
function SubPoolWrapper.prototype.isOwnedByUs(self)
    return __TS__ArrayIncludes(self.subPoolData.pluginIds, self.registry.pluginId)
end
function SubPoolWrapper.prototype.getNamePlaceHolderStartOnly(self)
    return tostring(self.subPoolData.range.start)
end
function SubPoolWrapper.prototype.getNamePlaceHolderRange(self)
    local range = self.subPoolData.range
    return ((("[" .. tostring(range.start)) .. "-") .. tostring(range.start + range.size - 1)) .. "]"
end
function SubPoolWrapper.prototype.setName(self, newName)
    if self.readOnly then
        error(READ_ONLY_MSG)
    end
    self.subPoolData.name = newName
    self:setDirty()
end
function SubPoolWrapper.prototype.setRange(self, newRange)
    if self.readOnly then
        error(READ_ONLY_MSG)
    end
    self.log:trace("setRange() " .. RangeUtils:describe(newRange))
    self.subPoolData.range = newRange
    self:setDirty()
end
function SubPoolWrapper.prototype.addReferenceIfNotInternal(self)
    if self.readOnly then
        error(READ_ONLY_MSG)
    end
    if not self.subPoolData.internal and not __TS__ArrayIncludes(self.subPoolData.pluginIds, self.registry.pluginId) then
        local ____self_subPoolData_pluginIds_0 = self.subPoolData.pluginIds
        ____self_subPoolData_pluginIds_0[#____self_subPoolData_pluginIds_0 + 1] = self.registry.pluginId
        self:setDirty()
    end
end
function SubPoolWrapper.prototype.getCollidingSubPools(self, newRange)
    return self.poolWrapper:getCollidingSubPools(self.subPoolId, newRange)
end
function SubPoolWrapper.prototype.findAvailableSubPoolRange(self, options)
    return self.poolWrapper:findAvailableSubPoolRange(__TS__ObjectAssign({}, options, {subPoolId = self.subPoolId}))
end
function SubPoolWrapper.prototype.cloneReadOnly(self)
    return self.readOnly and self or __TS__New(
        ____exports.SubPoolWrapper,
        __TS__ObjectAssign({}, self.params, {readOnly = true})
    )
end
return ____exports
 end,
["lib.plugins.SubPoolRegistry.SubPoolRegistry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local getStartAndStep
local ____MAPoolsInfo = require("lib.MAPoolsInfo")
local MAPoolsInfo = ____MAPoolsInfo.MAPoolsInfo
local ____PoolUtils = require("lib.PoolUtils")
local PoolUtils = ____PoolUtils.PoolUtils
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local ____PoolWrapper = require("lib.plugins.SubPoolRegistry.PoolWrapper")
local PoolWrapper = ____PoolWrapper.PoolWrapper
function getStartAndStep(self, poolInfo)
    local step = 100
    local start = 9901
    repeat
        local ____switch37 = poolInfo.maxObjects
        local ____cond37 = ____switch37 == 9999
        if ____cond37 then
            do
                start = 9901
                step = 100
                break
            end
        end
        ____cond37 = ____cond37 or ____switch37 == 1024
        if ____cond37 then
            do
                start = 1001
                step = 50
                break
            end
        end
        ____cond37 = ____cond37 or ____switch37 == 160
        if ____cond37 then
            do
                start = 151
                step = 10
                break
            end
        end
        ____cond37 = ____cond37 or ____switch37 == 128
        if ____cond37 then
            do
                start = 121
                step = 10
                break
            end
        end
        do
            do
                error("Unknown poolInfo.maxObjects = " .. tostring(poolInfo.maxObjects))
            end
        end
    until true
    return {start = start, step = step}
end
____exports.SubPoolRegistry = __TS__Class()
local SubPoolRegistry = ____exports.SubPoolRegistry
SubPoolRegistry.name = "SubPoolRegistry"
function SubPoolRegistry.prototype.____constructor(self, params)
    self.params = params
    self.data = params.data:getData()
    self.log = params.log:subLogger("SubPoolRegistry")
    self.readOnly = params.readOnly
    self.pluginId = params.pluginId
end
function SubPoolRegistry.prototype.setDirty(self)
    self.params.data:setDirty()
end
function SubPoolRegistry.prototype.provisionPluginSubPools(self, name, pluginAssetsCapacity)
    self.log:debug("provisionPluginSubPools: " .. name)
    if #objectKeys(nil, pluginAssetsCapacity) > 0 then
        local ranges = self:findAvailableRanges(pluginAssetsCapacity)
        __TS__ArrayForEach(
            objectKeys(nil, ranges),
            function(____, poolId)
                self:getPool(poolId):addInternalSubPool(ranges[poolId], name)
            end
        )
    end
end
function SubPoolRegistry.prototype.disassociateAllSubPools(self)
    __TS__ArrayForEach(
        objectKeys(nil, self.data.pools),
        function(____, poolId)
            self:getPool(poolId):disassociateAllSubPools()
        end
    )
    self:setDirty()
end
function SubPoolRegistry.prototype.associateAllNonInternalSubPools(self)
    __TS__ArrayForEach(
        objectKeys(nil, self.data.pools),
        function(____, poolId)
            self:getPool(poolId):associateAllNonInternalSubPools()
        end
    )
    self:setDirty()
end
function SubPoolRegistry.prototype.isEmpty(self)
    for ____, poolId in ipairs(objectKeys(nil, self.data.pools)) do
        local poolData = self.data.pools[poolId]
        if poolData ~= nil then
            if poolData.subPools ~= nil and #objectKeys(nil, poolData.subPools) > 0 then
                return false
            end
        end
    end
    return true
end
function SubPoolRegistry.prototype.getPluginInternalSubPool(self, pluginId, poolId)
    local subPools = __TS__ArrayFilter(
        self:getPool(poolId):getSubPools(),
        function(____, sp) return sp:isInternal() and __TS__ArrayIncludes(sp.pluginIds, pluginId) end
    )
    if #subPools > 1 then
        error(self.log:msg(((("getPluginInternalSubPool(" .. pluginId) .. ", ") .. poolId) .. "): Found more than one internal sub-pool."))
    elseif #subPools == 0 then
        return nil
    end
    return subPools[1]
end
function SubPoolRegistry.prototype.getAllInternalSubPools(self)
    local subPools = {}
    __TS__ArrayForEach(
        objectKeys(nil, self.data.pools),
        function(____, poolId)
            local subPool = self:getPluginInternalSubPool(self.pluginId, poolId)
            if subPool ~= nil then
                subPools[#subPools + 1] = subPool
            end
        end
    )
    return subPools
end
function SubPoolRegistry.prototype.getPool(self, poolId)
    local poolData = self.data.pools[poolId]
    if poolData == nil then
        poolData = {subPools = {}}
        self.data.pools[poolId] = poolData
    end
    return __TS__New(PoolWrapper, {
        registry = self,
        poolData = poolData,
        poolId = poolId,
        log = self.params.log,
        readOnly = self.params.readOnly
    })
end
function SubPoolRegistry.prototype.getPools(self)
    return __TS__ArrayMap(
        objectKeys(nil, self.data.pools),
        function(____, poolId) return self:getPool(poolId) end
    )
end
function SubPoolRegistry.prototype.findAvailableRanges(self, pluginAssetsCapacity)
    local poolIds = objectKeys(nil, pluginAssetsCapacity)
    assert(#poolIds > 0, "pluginAssetsCapacity must include one pool at least")
    local pluginSubPools = {}
    for ____, poolId in ipairs(objectKeys(nil, pluginAssetsCapacity)) do
        local size = pluginAssetsCapacity[poolId]
        local pool = self:getPool(poolId)
        local poolInfo = MAPoolsInfo(nil):byId(poolId)
        local poolObj = poolInfo:getPoolObject(poolInfo:getDefaultParent())
        local ____getStartAndStep_result_0 = getStartAndStep(nil, poolInfo)
        local _start = ____getStartAndStep_result_0.start
        local _step = ____getStartAndStep_result_0.step
        local start = _start
        local step = _step
        local foundOne = false
        while start >= 1 and not foundOne do
            local range = {start = start, size = size}
            if start + size - 1 <= poolInfo.maxObjects then
                local isColliding = #pool:getCollidingSubPools(nil, range) > 0
                local isEmpty = PoolUtils:isRangeEmpty(poolObj, range)
                if not isColliding and isEmpty then
                    pluginSubPools[poolId] = range
                    foundOne = true
                end
            end
            start = start - step
        end
        if not foundOne then
            error(((("Could not find available range of size " .. tostring(size)) .. " in ") .. poolId) .. " pool")
        end
    end
    return pluginSubPools
end
function ____exports.createSubPoolRegistryInitialData(self)
    return {pools = __TS__ArrayReduce(
        MAPoolsInfo(nil).allPools,
        function(____, pools, poolInfo)
            pools[poolInfo.id] = {subPools = {}}
            return pools
        end,
        {}
    )}
end
return ____exports
 end,
["lib.plugins.SubPoolRegistry.Utils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.nextSubPoolStart(self, fromIndex, subPoolStartStep)
    if fromIndex % subPoolStartStep == 1 then
        return fromIndex
    else
        return math.ceil(fromIndex / subPoolStartStep) * subPoolStartStep + 1
    end
end
--- Conceptually devides a pool to blocks of blockSize, starting at 1,
-- and return the block range that the given index is within.
function ____exports.getBlock(self, index, blockSize)
    if blockSize % 10 ~= 0 then
        error("getBlock(): blockSize must be a multiple of 10, and it's " .. tostring(blockSize))
    end
    if index % blockSize == 1 then
        return {start = index, size = blockSize}
    else
        if index % blockSize == 0 then
            return {
                start = (math.floor(index / blockSize) - 1) * blockSize + 1,
                size = blockSize
            }
        else
            return {
                start = math.floor(index / blockSize) * blockSize + 1,
                size = blockSize
            }
        end
    end
end
--- SubPoolStart always with 1 at the end (e.g 21, 41, 101,...)
-- This is assuming the subPoolStartStep is a multiply of 10
-- 
-- @param index
-- @param subPoolStartStep
-- @returns
function ____exports.thisSubPoolStart(self, index, subPoolStartStep)
    if subPoolStartStep % 10 ~= 0 then
        error("thisSubPoolStart(): subPoolStartStep must be a multiple of 10, and it's " .. tostring(subPoolStartStep))
    end
    if index % subPoolStartStep == 1 then
        return index
    else
        if index % subPoolStartStep == 0 then
            return (math.floor(index / subPoolStartStep) - 1) * subPoolStartStep + 1
        else
            return math.floor(index / subPoolStartStep) * subPoolStartStep + 1
        end
    end
end
return ____exports
 end,
["lib.plugins.SubPoolRegistry.PoolWrapper"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAPoolsInfo = require("lib.MAPoolsInfo")
local MAPoolsInfo = ____MAPoolsInfo.MAPoolsInfo
local ____PoolUtils = require("lib.PoolUtils")
local PoolUtils = ____PoolUtils.PoolUtils
local ____RangeUtils = require("lib.RangeUtils")
local RangeUtils = ____RangeUtils.RangeUtils
local ____Utils = require("lib.Utils")
local findFirstAvailableNumber = ____Utils.findFirstAvailableNumber
local nTimes = ____Utils.nTimes
local objectKeys = ____Utils.objectKeys
local ____SubPoolWrapper = require("lib.plugins.SubPoolRegistry.SubPoolWrapper")
local SubPoolWrapper = ____SubPoolWrapper.SubPoolWrapper
local ____Utils = require("lib.plugins.SubPoolRegistry.Utils")
local getBlock = ____Utils.getBlock
local nextSubPoolStart = ____Utils.nextSubPoolStart
____exports.DEFAULT_IGNORE_EXISTING_OBJECTS = true
____exports.READ_ONLY_MSG = "Attempt to mutate a readonly DataWrapper"
local MIN_USER_SUB_POOLS = 2
____exports.PoolWrapper = __TS__Class()
local PoolWrapper = ____exports.PoolWrapper
PoolWrapper.name = "PoolWrapper"
function PoolWrapper.prototype.____constructor(self, params)
    self.params = params
    self.registry = params.registry
    self.poolId = params.poolId
    self.poolData = params.poolData
    self.log = params.log:subLogger(("PoolWrapper(" .. self.poolId) .. ")")
    self.readOnly = params.readOnly
end
function PoolWrapper.prototype.setDirty(self)
    self.registry:setDirty()
end
function PoolWrapper.prototype.addSubPool(self, size, subPoolStartStep)
    if self.readOnly then
        error(____exports.READ_ONLY_MSG)
    end
    local subPoolId = self:nextSubPoolId()
    local range = self:findAvailableSubPoolRange({subPoolId = subPoolId, size = size, ignoreExistingObjects = ____exports.DEFAULT_IGNORE_EXISTING_OBJECTS, subPoolStartStep = subPoolStartStep})
    return self:doAddSubPool(range)
end
function PoolWrapper.prototype.addSubPoolWithRange(self, range)
    return self:doAddSubPool(range)
end
function PoolWrapper.prototype.addInternalSubPool(self, range, name)
    return self:doAddSubPool(range, true, name)
end
function PoolWrapper.prototype.doAddSubPool(self, range, internal, name)
    if internal == nil then
        internal = false
    end
    if self.readOnly then
        error(____exports.READ_ONLY_MSG)
    end
    local subPoolId = self:nextSubPoolId()
    if #self:getCollidingSubPools(nil, range) ~= 0 then
        error(self.log:msg(("doAddSubPool: Can not add range " .. RangeUtils:describe(range)) .. ". it collides with an existing sub-pool"))
    else
        self.log:info((("addSubPool: range=" .. RangeUtils:describe(range)) .. ", subPoolId=") .. subPoolId)
    end
    local subPoolData = {
        id = subPoolId,
        range = range,
        name = name,
        internal = internal,
        pluginIds = {self.registry.pluginId}
    }
    self.poolData.subPools[subPoolId] = subPoolData
    self:setDirty()
    return __TS__New(SubPoolWrapper, {
        registry = self.registry,
        poolWrapper = self,
        poolId = self.poolId,
        subPoolData = subPoolData,
        subPoolId = subPoolId,
        log = self.log,
        readOnly = self.readOnly
    })
end
function PoolWrapper.prototype.doDeleteSubPool(self, subPoolId)
    self.log:debug("delete subPoolId=" .. subPoolId)
    __TS__Delete(self.poolData.subPools, subPoolId)
    self:setDirty()
end
function PoolWrapper.prototype.removeSubPool(self, subPoolId)
    if self.readOnly then
        error(____exports.READ_ONLY_MSG)
    end
    self.log:info("remove subPoolId=" .. subPoolId)
    local spw = self:getSubPool(subPoolId)
    if spw ~= nil then
        if not spw:isOwnedByUs() or not spw.isInternal then
            error(self.log:msg("Not allowed to remove internal of not owned sub-pool"))
        else
            self:doDeleteSubPool(subPoolId)
        end
    end
end
function PoolWrapper.prototype.disassociateSubPool(self, subPoolId)
    if self.readOnly then
        error(____exports.READ_ONLY_MSG)
    end
    self.log:info((("disassociate subPoolId=" .. subPoolId) .. " from pluginId=") .. self.registry.pluginId)
    local subPooldata = self.poolData.subPools[subPoolId]
    if subPooldata ~= nil then
        local index = __TS__ArrayIndexOf(subPooldata.pluginIds, self.registry.pluginId)
        local changeMade = false
        if index ~= -1 then
            __TS__ArraySplice(subPooldata.pluginIds, index, 1)
            changeMade = true
        end
        if #subPooldata.pluginIds == 0 then
            self:doDeleteSubPool(subPoolId)
            changeMade = true
        end
        if changeMade then
            self:setDirty()
        end
    end
end
function PoolWrapper.prototype.associateSubPool(self, subPoolId)
    if self.readOnly then
        error(____exports.READ_ONLY_MSG)
    end
    local subPooldata = self.poolData.subPools[subPoolId]
    if not __TS__ArrayIncludes(subPooldata.pluginIds, self.registry.pluginId) then
        local ____subPooldata_pluginIds_0 = subPooldata.pluginIds
        ____subPooldata_pluginIds_0[#____subPooldata_pluginIds_0 + 1] = self.registry.pluginId
        self:setDirty()
    end
end
function PoolWrapper.prototype.getSubPool(self, subPoolId)
    local subPoolData = self.poolData.subPools[subPoolId]
    local ____temp_1
    if subPoolData == nil then
        ____temp_1 = nil
    else
        ____temp_1 = __TS__New(SubPoolWrapper, {
            registry = self.registry,
            poolWrapper = self,
            poolId = self.poolId,
            subPoolData = subPoolData,
            subPoolId = subPoolId,
            log = self.log,
            readOnly = self.readOnly
        })
    end
    return ____temp_1
end
function PoolWrapper.prototype.getSubPools(self)
    return __TS__ArrayMap(
        objectKeys(nil, self.poolData.subPools),
        function(____, subPoolId)
            return __TS__New(SubPoolWrapper, {
                registry = self.registry,
                poolWrapper = self,
                poolId = self.poolId,
                subPoolData = self.poolData.subPools[subPoolId],
                subPoolId = subPoolId,
                log = self.log,
                readOnly = self.readOnly
            })
        end
    )
end
function PoolWrapper.prototype.getSortedSubPools(self)
    return __TS__ArraySort(
        self:getSubPools(),
        function(____, a, b) return a.range.start - b.range.start end
    )
end
function PoolWrapper.prototype.nextSubPoolId(self)
    local ____self_poolData_2 = self.poolData
    local subPools = ____self_poolData_2.subPools
    local availableSubPoolIdNumber = findFirstAvailableNumber(
        nil,
        __TS__ArraySort(__TS__ArrayMap(
            objectKeys(nil, subPools),
            function(____, key) return __TS__ParseInt(key) end
        ))
    )
    return tostring(availableSubPoolIdNumber)
end
function PoolWrapper.prototype.findAvailableSubPoolRange(self, options)
    local ____options_3 = options
    local subPoolId = ____options_3.subPoolId
    local size = ____options_3.size
    local ignoreExistingObjects = ____options_3.ignoreExistingObjects
    local subPoolStartStep = ____options_3.subPoolStartStep
    local subPools = self.poolData.subPools
    local poolInfo = MAPoolsInfo(nil):byId(self.poolId)
    local poolObj = poolInfo:getPoolObject()
    local start = 1
    while start < poolInfo.maxObjects do
        local curRange = {start = start, size = size}
        local collidingRanges = self:getCollidingSubPools(subPoolId, curRange)
        if #collidingRanges == 0 then
            local ____ignoreExistingObjects_4 = ignoreExistingObjects
            if ____ignoreExistingObjects_4 == nil then
                ____ignoreExistingObjects_4 = ____exports.DEFAULT_IGNORE_EXISTING_OBJECTS
            end
            if ____ignoreExistingObjects_4 or PoolUtils:isRangeEmpty(poolObj, curRange) then
                return curRange
            else
                local emptyRange = PoolUtils:findEmptyRange(
                    self.poolId,
                    (PoolUtils:getLastObjectInRange(self.poolId, curRange) or curRange.start - 1) + 1,
                    size
                )
                if emptyRange == nil then
                    error(("findAvailableSubPoolRange: pool " .. self.poolId) .. " is full.")
                else
                    start = nextSubPoolStart(nil, emptyRange.start, subPoolStartStep)
                end
            end
        else
            local maxRangeEnd = math.max(table.unpack(__TS__ArrayMap(
                collidingRanges,
                function(____, r) return RangeUtils:lastIndex(r.range) end
            )))
            start = nextSubPoolStart(nil, maxRangeEnd + 1, subPoolStartStep)
        end
    end
    error(("findAvailableSubPoolRange: pool " .. self.poolId) .. " is full.")
end
function PoolWrapper.prototype.getCollidingSubPools(self, subPoolId, newRange)
    local collidingSubPools = {}
    for ____, curSubPool in ipairs(self:getSubPools()) do
        if subPoolId ~= curSubPool.id and RangeUtils:intersects(newRange, curSubPool.range) then
            collidingSubPools[#collidingSubPools + 1] = curSubPool
        end
    end
    return collidingSubPools
end
function PoolWrapper.prototype.createInitialUserSubPoolsIfNeeded(self, defaultSubPoolSize)
    if self.readOnly then
        error(____exports.READ_ONLY_MSG)
    end
    self:createSubPoolsForExistingObjects(defaultSubPoolSize)
    self:createEmptySubPoolsIfNeeded(defaultSubPoolSize)
end
function PoolWrapper.prototype.createSubPoolsForExistingObjects(self, defaultSubPoolSize)
    local poolId = self.poolId
    local poolsInfo = MAPoolsInfo(nil)
    local poolInfo = poolsInfo:byId(poolId)
    local maxObjects = poolInfo.maxObjects
    local stepSize = defaultSubPoolSize
    __TS__ArrayForEach(
        PoolUtils:getSortedUsedIndice(poolId),
        function(____, usedIndex)
            local existingSubPoolRanges = __TS__ArrayMap(
                self:getSubPools(),
                function(____, sp) return sp.range end
            )
            local subPools = self:getSortedSubPools()
            local function isInSomeSubPool(self, index)
                return __TS__ArrayFind(
                    existingSubPoolRanges,
                    function(____, r) return RangeUtils:isInRange(index, r) end
                ) ~= nil
            end
            local function getClosestSubPoolRanges(self, index)
                if #subPools == 0 then
                    return {prev = nil, next = nil}
                end
                do
                    local i = 0
                    while i < #subPools do
                        local range = subPools[i + 1].range
                        if i + 1 == #subPools then
                            local start = range.start
                            local ____end = RangeUtils:lastIndex(range)
                            if index > ____end then
                                return {prev = range, next = nil}
                            elseif index < start then
                                return {prev = nil, next = range}
                            else
                                error("getClosestSubPoolRanges(): index should be in a sub-pool")
                            end
                        else
                            local nextRange = subPools[i + 1 + 1].range
                            if index < range.start then
                                return {prev = nil, next = range}
                            elseif index > RangeUtils:lastIndex(range) and index < nextRange.start then
                                return {prev = range, next = nextRange}
                            end
                        end
                        i = i + 1
                    end
                end
                error("getClosestSubPoolRanges(): index should be in a sub-pool")
            end
            if not isInSomeSubPool(nil, usedIndex) then
                local currentBlock = getBlock(nil, usedIndex, stepSize)
                local ____getClosestSubPoolRanges_result_5 = getClosestSubPoolRanges(nil, usedIndex)
                local prev = ____getClosestSubPoolRanges_result_5.prev
                local next = ____getClosestSubPoolRanges_result_5.next
                local start = math.max(
                    currentBlock.start,
                    prev == nil and 0 or RangeUtils:lastIndex(prev) + 1
                )
                local last = math.min(
                    RangeUtils:lastIndex(currentBlock),
                    next == nil and maxObjects or next.start - 1
                )
                local range = {start = start, size = last - start + 1}
                self:addSubPoolWithRange(range)
            end
        end
    )
end
function PoolWrapper.prototype.createEmptySubPoolsIfNeeded(self, defaultSubPoolSize)
    local numOfNonInternalSubPools = #__TS__ArrayFilter(
        self:getSubPools(),
        function(____, sp) return not sp:isInternal() end
    )
    if numOfNonInternalSubPools >= MIN_USER_SUB_POOLS then
        return
    end
    local subPoolsToAdd = MIN_USER_SUB_POOLS - numOfNonInternalSubPools
    nTimes(
        nil,
        subPoolsToAdd,
        function()
            self:addSubPool(defaultSubPoolSize, defaultSubPoolSize)
        end
    )
end
function PoolWrapper.prototype.disassociateAllSubPools(self)
    __TS__ArrayForEach(
        objectKeys(nil, self.poolData.subPools),
        function(____, subPoolId)
            self:disassociateSubPool(subPoolId)
        end
    )
end
function PoolWrapper.prototype.associateAllNonInternalSubPools(self)
    __TS__ArrayForEach(
        objectKeys(nil, self.poolData.subPools),
        function(____, subPoolId)
            local subPool = self:getSubPool(subPoolId)
            if not subPool:isInternal() then
                self:associateSubPool(subPoolId)
            end
        end
    )
end
return ____exports
 end,
["lib.plugins.SubPoolRegistry.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____export = require("lib.plugins.SubPoolRegistry.PoolWrapper")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugins.SubPoolRegistry.SubPoolRegistry")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugins.SubPoolRegistry.SubPoolWrapper")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lib.plugins.SubPoolRegistry.Utils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lib.plugins.PluginsRegistry.OldPluginsRegistryHack"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local GlobalVariable, PLUGINS_REGISTRY_GLOBAL_VAR_NAME
function ____exports.isPluginsRegistryExists(self)
    return GlobalVariable[PLUGINS_REGISTRY_GLOBAL_VAR_NAME] ~= nil
end
function ____exports.getPluginsRegistry(self)
    local registry = GlobalVariable[PLUGINS_REGISTRY_GLOBAL_VAR_NAME]
    return registry
end
GlobalVariable = _G
PLUGINS_REGISTRY_GLOBAL_VAR_NAME = "pro_plugins__plugins_registry__0_3_0"
function ____exports.onOldUnregister(self, callback)
    if ____exports.isPluginsRegistryExists(nil) then
        local pr = ____exports.getPluginsRegistry(nil)
        local originalUnregister = pr.unregister
        pr.unregister = function(____, pluginId)
            Echo("old unregister SPY called")
            originalUnregister(
                pr,
                table.unpack({pluginId})
            )
            callback(nil, pluginId)
        end
    end
end
return ____exports
 end,
["lib.plugins.PluginsRegistry.PluginsEvents"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local createEventDispatcher
local ____EventEmitter = require("lib.EventEmitter")
local EventEmitter = ____EventEmitter.EventEmitter
local ____Utils = require("lib.Utils")
local getErrorMessage = ____Utils.getErrorMessage
function createEventDispatcher(self, log, eventQueue)
    return {emit = function(self, event)
        log:trace(("emit \"" .. event.eventName) .. "\" ")
        if __TS__ArrayFind(
            eventQueue,
            function(____, e) return e.eventName == event.eventName end
        ) == nil then
            log:trace(("adding event \"" .. event.eventName) .. "\" to the eventQueue")
            eventQueue[#eventQueue + 1] = event
        else
            log:trace(("event \"" .. event.eventName) .. "\" already exists in the eventQueue")
        end
    end}
end
____exports.PluginsEvents = __TS__Class()
local PluginsEvents = ____exports.PluginsEvents
PluginsEvents.name = "PluginsEvents"
function PluginsEvents.prototype.____constructor(self, parentLog)
    local log = parentLog:subLogger("PluginsEvents")
    self.log = log
    local eventQueue = {}
    self.eventQueue = eventQueue
    self.eventDispatcher = createEventDispatcher(nil, log, eventQueue)
    local eventEmitter = __TS__New(EventEmitter)
    self.eventEmitter = eventEmitter
    self.events = eventEmitter
end
function PluginsEvents.prototype.flushEventQueue(self, log)
    if #self.eventQueue == 0 then
        log:trace("flushEventQueue(): eventQueue.length=" .. tostring(#self.eventQueue))
        return
    end
    local count = 1
    while #self.eventQueue > 0 and count < 100 do
        log:trace((("flushEventQueue(): BEFORE POP: count=" .. tostring(count)) .. ", eventQueue.length=") .. tostring(#self.eventQueue))
        local deletedEvents = __TS__ArraySplice(self.eventQueue, 0, 1)
        local event = deletedEvents[1]
        log:trace((((("flushEventQueue(): AFTER POP: count=" .. tostring(count)) .. ", eventQueue.length=") .. tostring(#self.eventQueue)) .. ", event=") .. event.eventName)
        do
            local function ____catch(err)
                log:error("PluginRegistry.flushEventQueue() ERROR: " .. getErrorMessage(nil, err))
            end
            local ____try, ____hasReturned = pcall(function()
                self.eventEmitter:emit(event)
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
        count = count + 1
    end
    if count == 100 then
        error("flushEventQueue(): queue reached limit of 100")
    end
end
function PluginsEvents.prototype.destroy(self)
    self.log:trace("destroy()")
    self.eventEmitter:removeAllListeners()
    __TS__ArraySplice(self.eventQueue, 0, #self.eventQueue)
end
return ____exports
 end,
["lib.plugins.PluginsRegistry.PluginsRegistry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local SubPoolRegistryDataAccess, SUB_POOL_REGISTRY_VARIABLED_ID, SUB_POOL_REGISTRY_DATA_VAR_NAME
local ____Logger = require("lib.Logger")
local LogLevel = ____Logger.LogLevel
local Logger = ____Logger.Logger
local ____MAVariables = require("lib.MAVariables")
local MAVariables = ____MAVariables.MAVariables
local ____PersistentDataAccess = require("lib.PersistentDataAccess")
local PersistentDataAccess = ____PersistentDataAccess.PersistentDataAccess
local ____SingletonFactory = require("lib.SingletonFactory")
local getOrCreateShowSingleton = ____SingletonFactory.getOrCreateShowSingleton
local getShowSingleton = ____SingletonFactory.getShowSingleton
local isShowSingletonExists = ____SingletonFactory.isShowSingletonExists
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local ____SubPoolRegistry = require("lib.plugins.SubPoolRegistry.index")
local SubPoolRegistry = ____SubPoolRegistry.SubPoolRegistry
local createSubPoolRegistryInitialData = ____SubPoolRegistry.createSubPoolRegistryInitialData
local ____SocketMutexRegistry = require("lib.plugins.SocketMutexRegistry.SocketMutexRegistry")
local SocketMutexRegistry = ____SocketMutexRegistry.SocketMutexRegistry
local ____OldPluginsRegistryHack = require("lib.plugins.PluginsRegistry.OldPluginsRegistryHack")
local onOldUnregister = ____OldPluginsRegistryHack.onOldUnregister
local ____PluginsEvents = require("lib.plugins.PluginsRegistry.PluginsEvents")
local PluginsEvents = ____PluginsEvents.PluginsEvents
function SubPoolRegistryDataAccess(self, log)
    return PersistentDataAccess(
        nil,
        MAVariables(nil, {storageType = "ShowFile", variablesId = SUB_POOL_REGISTRY_VARIABLED_ID}),
        SUB_POOL_REGISTRY_DATA_VAR_NAME,
        log
    )
end
--- Plugins Registry let plugins interact with each other.
-- This is a global singleton.
-- It resides in the Global LUA space.
-- It perishs when MA3 is shutdown.
local GlobalVariable = _G
local PLUGINS_REGISTRY_GLOBAL_VAR_NAME = "pro_plugins__plugins_registry__0_5_0"
____exports.PLUGINS_REGISTRY_GLOBAL_VERSION = "0.5.0"
SUB_POOL_REGISTRY_VARIABLED_ID = "pro_plugins__sub_pool_registry__v0_3_0"
SUB_POOL_REGISTRY_DATA_VAR_NAME = "SUB_POOL_REGISTRY_DATA"
local SUB_POOL_REGISTRY_VERSION = "0.3.0"
____exports.PluginsRegistry = __TS__Class()
local PluginsRegistry = ____exports.PluginsRegistry
PluginsRegistry.name = "PluginsRegistry"
function PluginsRegistry.prototype.____constructor(self)
    self.version = ____exports.PLUGINS_REGISTRY_GLOBAL_VERSION
    self.pluginsData = {}
    local log = Logger(nil, {prefix = {"PluginsRegistry v" .. ____exports.PLUGINS_REGISTRY_GLOBAL_VERSION}, logLevel = LogLevel.ERROR})
    self.log = log
    local pluginsEvents = __TS__New(PluginsEvents, log)
    self.pluginsEvents = pluginsEvents
    self.eventDispatcher = pluginsEvents.eventDispatcher
    self.events = pluginsEvents.events
    self.socketMutexRegistry = __TS__New(SocketMutexRegistry)
    self.subPoolRegistryDataAccess = SubPoolRegistryDataAccess(nil, log)
    onOldUnregister(
        nil,
        function(____, pluginId) return self:onOldUnregister(pluginId) end
    )
end
function PluginsRegistry.prototype.onOldUnregister(self, pluginId)
    self.log:trace("onOldUnregister pluginId=" .. pluginId)
    self.subPoolRegistryDataAccess:read()
    __TS__New(SubPoolRegistry, {
        data = self.subPoolRegistryDataAccess,
        pluginId = pluginId,
        readOnly = false,
        eventEmitter = self.eventDispatcher,
        log = self.log
    }):disassociateAllSubPools()
    self.eventDispatcher:emit({
        eventName = "subPoolsChange",
        displayHandle = GetDisplayByIndex(1),
        pluginId = pluginId
    })
    coroutine.yield()
    self.log:trace(("onOldUnregister pluginId=" .. pluginId) .. ": FLUSH")
    self:flushEventQueue(self.log)
end
function PluginsRegistry.prototype.flushEventQueue(self, log)
    return self.pluginsEvents:flushEventQueue(log)
end
function PluginsRegistry.prototype.getOrInitSubPoolRegistryDataAccess(self)
    local spda = self.subPoolRegistryDataAccess
    if not spda:isCachedDataExists() then
        if spda:isDataExists() then
            if not spda:read() then
                error((("Could not find MA variables data: variablesId=" .. spda.variablesId) .. ", varName=") .. spda.varName)
            end
        else
            spda:setData(createSubPoolRegistryInitialData(nil))
        end
    end
    return spda
end
function PluginsRegistry.prototype.subPoolRegistryDataExists(self)
    return self.subPoolRegistryDataAccess:isDataExists()
end
function PluginsRegistry.prototype.getSubPoolRegistryId(self)
    return self.subPoolRegistryDataAccess.variablesId
end
function PluginsRegistry.prototype.destroy(self)
    self.log:trace("destroy()")
    self.pluginsEvents:destroy()
    __TS__ArrayForEach(
        objectKeys(nil, self.pluginsData),
        function(____, pluginId)
            __TS__Delete(self.pluginsData, pluginId)
        end
    )
    __TS__Delete(GlobalVariable, PLUGINS_REGISTRY_GLOBAL_VAR_NAME)
    self.socketMutexRegistry:destroy()
end
function PluginsRegistry.prototype.getRegisteredPluginIds(self)
    return objectKeys(nil, self.pluginsData)
end
function PluginsRegistry.prototype.register(self, pluginEnv, pluginInfo)
    self.pluginsData[pluginEnv.pluginId] = {pluginInfo = pluginInfo, pluginEnv = pluginEnv}
end
function PluginsRegistry.prototype.unregister(self, pluginId)
    __TS__Delete(self.pluginsData, pluginId)
    local pluginIds = objectKeys(nil, self.pluginsData)
    if #pluginIds == 0 then
        self.log:debug("unregister() no more plugins left. destroying registry")
        self:destroy()
    else
        self.log:debug(("unregister() still " .. tostring(#pluginIds)) .. " plugins left")
    end
    self.socketMutexRegistry:cleanup(pluginId)
end
function PluginsRegistry.prototype.setLogLevel(self, level)
    self.log:setLogLevel(level)
end
function PluginsRegistry.prototype.describe(self)
    return PLUGINS_REGISTRY_GLOBAL_VAR_NAME
end
function PluginsRegistry.getOrCreate(self)
    return getOrCreateShowSingleton(
        nil,
        PLUGINS_REGISTRY_GLOBAL_VAR_NAME,
        function() return __TS__New(____exports.PluginsRegistry) end
    )
end
function PluginsRegistry.get(self)
    return getShowSingleton(nil, PLUGINS_REGISTRY_GLOBAL_VAR_NAME)
end
function PluginsRegistry.exists(self)
    return isShowSingletonExists(nil, PLUGINS_REGISTRY_GLOBAL_VAR_NAME)
end
--- ***********************************************
-- These functions are for the Dev Tools only
-- ************************************************
____exports.SubPoolsRegistryDevToolsUtils = {
    version = SUB_POOL_REGISTRY_VERSION,
    readSubPoolRegistryData = function(self)
        local spda = SubPoolRegistryDataAccess(
            nil,
            Logger(nil)
        )
        if spda:isDataExists() then
            spda:read()
            return spda:getData()
        else
            return nil
        end
    end,
    deleteSubPoolRegistryData = function(self)
        local spda = SubPoolRegistryDataAccess(
            nil,
            Logger(nil)
        )
        spda:cleanUp()
    end
}
return ____exports
 end,
["lib.plugin.PluginEventHandler"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Logger = require("lib.Logger")
local LogLevel = ____Logger.LogLevel
local ____PluginsRegistry = require("lib.plugins.PluginsRegistry.PluginsRegistry")
local PluginsRegistry = ____PluginsRegistry.PluginsRegistry
local ____ui = require("lib.ui.index")
local showAlert = ____ui.showAlert
local startUI = ____ui.startUI
local ____dialogs = require("lib.ui.dialogs.index")
local MultiActionDialog = ____dialogs.MultiActionDialog
local ____Utils = require("lib.Utils")
local protectedCall = ____Utils.protectedCall
local ____EventProviders = require("lib.plugin.EventProviders")
local eventBuilder = ____EventProviders.eventBuilder
local MultiProvider = ____EventProviders.MultiProvider
____exports.PluginEventHandler = __TS__Class()
local PluginEventHandler = ____exports.PluginEventHandler
PluginEventHandler.name = "PluginEventHandler"
function PluginEventHandler.prototype.____constructor(self, options)
    self.options = options
    self.state = {isDuringReadWriteEvent = false, curEventName = nil}
    local pu = self.options.pu
    self.log = self.options.log:subLogger("EventHandler")
    self.eventBuilder = function(____, eventName) return eventBuilder(
        nil,
        eventName,
        pu,
        self.options.runtime,
        self.options.displayHandle,
        self.options.log
    ) end
end
function PluginEventHandler.prototype.handlePluginEvent(self, eventName, action, options)
    local ____self_2 = self:eventBuilder(eventName)
    local ____self_2_withUndo_3 = ____self_2.withUndo
    local ____options_undoBlockEnabled_0 = options
    if ____options_undoBlockEnabled_0 ~= nil then
        ____options_undoBlockEnabled_0 = ____options_undoBlockEnabled_0.undoBlockEnabled
    end
    local eventBuilder = ____self_2_withUndo_3(____self_2, {undoBlockEnabled = ____options_undoBlockEnabled_0})
    if self.options.needsInstall then
        local event = eventBuilder:withData():withSubPoolRegistryData():build()
        return self:doHandleEvent(
            event,
            function(____, p)
                local context = self.options.contextBuilder:buildPluginContext(
                    p.data:getData(),
                    p.undo,
                    p.subPoolRegistryData,
                    event.log
                )
                return action(nil, context)
            end
        )
    else
        local event = eventBuilder:build()
        return self:doHandleEvent(
            event,
            function(____, p)
                local context = self.options.contextBuilder:buildPluginContext({}, p.undo, {}, event.log)
                return action(nil, context)
            end
        )
    end
end
function PluginEventHandler.prototype.handlePluginEventReadOnly(self, eventName, action, options)
    if self.options.needsInstall then
        local ____self_6 = self:eventBuilder(eventName):withData({readOnly = true})
        local ____self_6_withUndo_7 = ____self_6.withUndo
        local ____options_undoBlockEnabled_4 = options
        if ____options_undoBlockEnabled_4 ~= nil then
            ____options_undoBlockEnabled_4 = ____options_undoBlockEnabled_4.undoBlockEnabled
        end
        local event = ____self_6_withUndo_7(____self_6, {undoBlockEnabled = ____options_undoBlockEnabled_4}):withSubPoolRegistryData({readOnly = true}):build()
        return self:doHandleEvent(
            event,
            function(____, p)
                local context = self.options.contextBuilder:buildPluginContextReadOnly(
                    p.data:getData(),
                    p.undo,
                    p.subPoolRegistryData,
                    event.log
                )
                return action(nil, context)
            end,
            true
        )
    else
        local ____self_10 = self:eventBuilder(eventName)
        local ____self_10_withUndo_11 = ____self_10.withUndo
        local ____options_undoBlockEnabled_8 = options
        if ____options_undoBlockEnabled_8 ~= nil then
            ____options_undoBlockEnabled_8 = ____options_undoBlockEnabled_8.undoBlockEnabled
        end
        local event = ____self_10_withUndo_11(____self_10, {undoBlockEnabled = ____options_undoBlockEnabled_8}):build()
        return self:doHandleEvent(
            event,
            function(____, p)
                local context = self.options.contextBuilder:buildPluginContextReadOnly({}, p.undo, {}, event.log)
                return action(nil, context)
            end,
            true
        )
    end
end
function PluginEventHandler.prototype.handleInstanceEvent(self, eventName, instanceId, action, options)
    if not self.options.needsInstall then
        error("Plugin with no install can not have instances")
    end
    local ____self_14 = self:eventBuilder(eventName):withData()
    local ____self_14_withUndo_15 = ____self_14.withUndo
    local ____options_undoBlockEnabled_12 = options
    if ____options_undoBlockEnabled_12 ~= nil then
        ____options_undoBlockEnabled_12 = ____options_undoBlockEnabled_12.undoBlockEnabled
    end
    local event = ____self_14_withUndo_15(____self_14, {undoBlockEnabled = ____options_undoBlockEnabled_12}):withSubPoolRegistryData():build()
    return self:doHandleEvent(
        event,
        function(____, p)
            local context = self.options.contextBuilder:buildInstanceContext(
                p.data:getData(),
                instanceId,
                p.undo,
                p.subPoolRegistryData,
                event.log
            )
            return action(nil, context)
        end
    )
end
function PluginEventHandler.prototype.handleInstanceEventReadOnly(self, eventName, instanceId, action, options)
    if not self.options.needsInstall then
        error("Plugin has no install")
    end
    local ____self_18 = self:eventBuilder(eventName):withData({readOnly = true})
    local ____self_18_withUndo_19 = ____self_18.withUndo
    local ____options_undoBlockEnabled_16 = options
    if ____options_undoBlockEnabled_16 ~= nil then
        ____options_undoBlockEnabled_16 = ____options_undoBlockEnabled_16.undoBlockEnabled
    end
    local event = ____self_18_withUndo_19(____self_18, {undoBlockEnabled = ____options_undoBlockEnabled_16}):withSubPoolRegistryData({readOnly = true}):build()
    return self:doHandleEvent(
        event,
        function(____, p)
            local context = self.options.contextBuilder:buildInstanceContextReadOnly(
                p.data:getData(),
                instanceId,
                p.undo,
                p.subPoolRegistryData,
                event.log
            )
            return action(nil, context)
        end,
        true
    )
end
function PluginEventHandler.prototype.handleInstallEvent(self, fn)
    if not self.options.needsInstall then
        error("Plugin has no install")
    end
    local event = self:eventBuilder("Install"):withUndo():withSubPoolRegistryData():build()
    return self:doHandleEvent(
        event,
        function(____, p)
            return fn(nil, p.undo, p.subPoolRegistryData, event.log)
        end,
        true
    )
end
function PluginEventHandler.prototype.handleInitUserDataEvent(self, fn)
    if not self.options.needsInstall then
        error("Plugin has no install")
    end
    local event = self:eventBuilder("Init User Data"):withData():build()
    return self:doHandleEvent(
        event,
        function(____, p)
            return fn(
                nil,
                p.data:getData()
            )
        end,
        true
    )
end
function PluginEventHandler.prototype.handleUninstallEvent(self, eventName, fn)
    local event = self:eventBuilder(eventName):withUndo():build()
    return self:doHandleEvent(
        event,
        function(____, p)
            return fn(nil, p.undo, event.log)
        end,
        true
    )
end
function PluginEventHandler.prototype.doHandleEvent(self, event, fn, readOnly)
    if readOnly == nil then
        readOnly = false
    end
    local function handleEvent()
        local provider = MultiProvider(
            nil,
            event.log,
            event.providers,
            {log = self.options.log:subLogger(event.eventName)}
        )
        provider:prepare()
        local result = fn(
            nil,
            provider:getValue()
        )
        provider:finalize()
        return result
    end
    local result = self:wrapEventHandler(event.eventName, handleEvent, readOnly, event.log)
    if PluginsRegistry:exists() then
        PluginsRegistry:get():flushEventQueue(self.log:subLogger("POST EVENT"))
    end
    return result
end
function PluginEventHandler.prototype.handleProtectedEvent(self, eventName, fn)
    local event = self:eventBuilder(eventName):build()
    self:wrapEventHandler(event.eventName, fn, true, event.log)
end
function PluginEventHandler.prototype.wrapEventHandler(self, eventName, handleEvent, readOnly, log)
    log:trace("event START")
    if not readOnly then
        if self.state.isDuringReadWriteEvent then
            error((("PluginEventHandler: Can not start a new event during another event handling. Currently handled event: " .. tostring(self.state.curEventName)) .. ", newEvent: ") .. eventName)
        else
            self.state.isDuringReadWriteEvent = true
            self.state.curEventName = eventName
        end
    end
    local ____self_options_20 = self.options
    local displayHandle = ____self_options_20.displayHandle
    local pluginEnv = ____self_options_20.pluginEnv
    local pluginName = self.options.pluginEnv.pluginName
    local function handleEventError(____, proError)
        showAlert(nil, displayHandle.index, ((pluginName .. " (v") .. self.options.pluginEnv.pluginVersion) .. "): ERROR !", ("Oops, this error just occured:\n\n" .. proError.message) .. "\n\n- Please make a screenshot of this screen\n\n  - And click OK to DumpLog.")
        Cmd("DumpLog")
        showAlert(
            nil,
            displayHandle.index,
            pluginName .. ": Collect Log File",
            ("Please send the screenshort you've made, and also please locate the log file (.txt) that was just created. It should be under:\n\n " .. tostring(GetPath(Enums.PathType.CrashLog))) .. "\n\n Please send this file to:\n\n hepi@ma3-pro-plugins.com\n\nThank You !"
        )
        if log:getLogLevel() ~= LogLevel.TRACE then
            self.options.runtime:setLogLevel(LogLevel.TRACE)
            showAlert(nil, displayHandle.index, pluginEnv.pluginName .. ": Please Reproduce", "We enabled TRACE logs now.\n\n Could you please reproduce the error again.\n\nThank you, and sorry for your trouble.")
        end
        startUI(
            nil,
            displayHandle,
            MultiActionDialog(
                nil,
                {
                    title = self.options.pluginEnv.pluginName .. ": Re-init Plugin Data?",
                    message = "If the main menu doesn't work, then the plugin's data might be corrupted. Click \"Uninstall\" to delete ALL plugin data.",
                    actions = {
                        {
                            label = "Keep going",
                            action = function() return {type = "Quit"} end
                        },
                        {
                            label = "Uninstall",
                            action = function()
                                self.options:hardUninstall()
                                return {type = "Quit"}
                            end
                        }
                    }
                }
            )
        )
        self.state.isDuringReadWriteEvent = false
    end
    local ____protectedCall_result_21 = protectedCall(
        nil,
        {
            fn = function() return handleEvent(nil) end,
            onError = handleEventError,
            errorPrefix = pluginName
        }
    )
    local success = ____protectedCall_result_21.success
    local returnValue = ____protectedCall_result_21.returnValue
    self.state.isDuringReadWriteEvent = false
    if not success then
        error(pluginName .. ": PluginEventManager ERROR. See Traceback above.", 0)
    end
    log:trace("event END")
    return returnValue
end
return ____exports
 end,
["lib.plugin.types.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.plugin.types.pluginDataTypes"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.plugin.types.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["lib.plugin.PluginConstants"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____MAVariables = require("lib.MAVariables")
local MAVariables = ____MAVariables.MAVariables
local ____PersistentDataAccess = require("lib.PersistentDataAccess")
local PersistentDataAccess = ____PersistentDataAccess.PersistentDataAccess
____exports.PLUGIN_DATA_VAR_NAME = "PLUGIN_DATA"
function ____exports.PluginDataAccess(self, pluginId, log)
    return PersistentDataAccess(
        nil,
        MAVariables(nil, {storageType = "ShowFile", variablesId = pluginId}),
        ____exports.PLUGIN_DATA_VAR_NAME,
        log,
        {isDirtyEnabled = false}
    )
end
return ____exports
 end,
["lib.plugin.PluginBase"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ExternalCommandCodecV2 = require("lib.ExternalCommandCodecV2")
local ActionCodec = ____ExternalCommandCodecV2.ActionCodec
local ____PluginConstants = require("lib.plugin.PluginConstants")
local PluginDataAccess = ____PluginConstants.PluginDataAccess
local ____PluginsRegistry = require("lib.plugins.PluginsRegistry.PluginsRegistry")
local PluginsRegistry = ____PluginsRegistry.PluginsRegistry
local ____SubPoolRegistry = require("lib.plugins.SubPoolRegistry.index")
local SubPoolRegistry = ____SubPoolRegistry.SubPoolRegistry
local ____ui = require("lib.ui.index")
local showAlert = ____ui.showAlert
local startUI = ____ui.startUI
local ____components = require("lib.ui.components.index")
local ModalDialog = ____components.ModalDialog
local UIFactory = ____components.UIFactory
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local ____PluginEventHandler = require("lib.plugin.PluginEventHandler")
local PluginEventHandler = ____PluginEventHandler.PluginEventHandler
local ____PluginInstaller = require("lib.plugin.PluginInstaller")
local PluginInstaller = ____PluginInstaller.PluginInstaller
local ____PluginSignals = require("lib.plugin.PluginSignals")
local PluginSignals = ____PluginSignals.PluginSignals
local ____PluginUtils = require("lib.plugin.PluginUtils")
local PluginUtils = ____PluginUtils.PluginUtils
____exports.PluginBase = __TS__Class()
local PluginBase = ____exports.PluginBase
PluginBase.name = "PluginBase"
function PluginBase.prototype.____constructor(self, options)
    self.options = options
    local ____options_0 = options
    local builtInImages = ____options_0.builtInImages
    local pluginEnv = ____options_0.pluginEnv
    local pluginInfo = ____options_0.pluginInfo
    local contextBuilder = ____options_0.contextBuilder
    local createDefaultUserData = ____options_0.createDefaultUserData
    local pluginAssetsCapacity = ____options_0.pluginAssetsCapacity
    local dataMigrations = ____options_0.dataMigrations
    local displayHandle = ____options_0.displayHandle
    local runtime = ____options_0.runtime
    local _needsInstall = ____options_0.needsInstall
    local ____temp_1
    if _needsInstall == nil then
        ____temp_1 = true
    else
        ____temp_1 = _needsInstall
    end
    self.needsInstall = ____temp_1
    local log = runtime.log
    runtime:update(pluginInfo)
    self.internalDataAccess = function() return PluginDataAccess(nil, self.pu.pluginId, self.log) end
    self.createDefaultUserData = createDefaultUserData
    local pu = PluginUtils(nil, pluginEnv, pluginInfo)
    local eventHandler = __TS__New(
        PluginEventHandler,
        {
            pu = pu,
            pluginEnv = pluginEnv,
            displayHandle = options.displayHandle,
            contextBuilder = contextBuilder,
            log = log,
            runtime = runtime,
            needsInstall = self.needsInstall,
            hardUninstall = function() return self:uninstall(self.displayHandle, true) end
        }
    )
    self.pu = pu
    self.contextBuilder = contextBuilder
    self.eventHandler = eventHandler
    self.contextBuilder:setEventHandler(eventHandler)
    self.displayHandle = displayHandle
    self._installer = __TS__New(
        PluginInstaller,
        {
            pluginInfo = pluginInfo,
            pluginEnv = pluginEnv,
            contextBuilder = contextBuilder,
            builtInImages = builtInImages,
            pluginAssetsCapacity = pluginAssetsCapacity,
            dataMigrations = dataMigrations,
            displayHandle = displayHandle,
            eventHandler = eventHandler,
            onInstanceDelete = self.onInstanceDelete,
            onUninstall = function(____, pluginData, undo, displayHandle, subPoolRegistryData, log) return self:onUninstall(
                pluginData,
                undo,
                displayHandle,
                subPoolRegistryData,
                log
            ) end,
            log = log,
            runtime = runtime
        }
    )
    local signals = __TS__New(PluginSignals, self.pu.pluginInfo, log)
    self.dialogFactory = {
        ModalDialog = function(____, options)
            return __TS__New(ModalDialog, {pluginInfo = self.pu.pluginInfo, pluginSignals = signals, options = options, log = log})
        end,
        uiFactory = __TS__New(UIFactory, {pluginInfo = pluginInfo, pluginSignals = signals, log = self.log}),
        pluginSignals = signals
    }
end
__TS__SetDescriptor(
    PluginBase.prototype,
    "log",
    {get = function(self)
        return self:getRuntime().log
    end},
    true
)
function PluginBase.prototype.handleMain(self, params)
    local ____params_2 = params
    local argument = ____params_2.argument
    local MainDialog = ____params_2.MainDialog
    local ExternalActionHandler = ____params_2.ExternalActionHandler
    local userDialogV2 = ____params_2.userDialogV2
    local runtime = self:getRuntime()
    if self:isInstalled() then
        PluginsRegistry:getOrCreate():register(self.pu.pluginEnv, self.options.pluginInfo)
        runtime:initPluginsRegistryEventListener()
    end
    if argument == nil then
        if userDialogV2 then
            self:showDialog(MainDialog(nil, self))
        else
            startUI(
                nil,
                self.options.displayHandle,
                MainDialog(nil, self)
            )
        end
    else
        local action = ActionCodec:decodeAction(argument)
        local ____runtime_getExtActionHandler_result_handle_result_3 = runtime:getExtActionHandler(action.type)
        if ____runtime_getExtActionHandler_result_handle_result_3 ~= nil then
            ____runtime_getExtActionHandler_result_handle_result_3 = ____runtime_getExtActionHandler_result_handle_result_3:handle(self, action)
        end
        local handled = ____runtime_getExtActionHandler_result_handle_result_3
        if not handled then
            ExternalActionHandler(
                nil,
                self,
                runtime.log:subLogger("ExtAction")
            ):handle(action)
        end
    end
end
function PluginBase.prototype.handleMainV2(self, params)
    local ____params_5 = params
    local argument = ____params_5.argument
    local MainDialog = ____params_5.MainDialog
    local ExternalActionHandler = ____params_5.ExternalActionHandler
    local runtime = self:getRuntime()
    if self:isInstalled() then
        PluginsRegistry:getOrCreate():register(self.pu.pluginEnv, self.options.pluginInfo)
        runtime:initPluginsRegistryEventListener()
        self:handlePluginEventReadOnly(
            "InitHooks",
            function(____, pluginContext)
                self:initHooks(pluginContext)
            end
        )
    end
    if argument == nil then
        self:showDialog(MainDialog(nil, self))
    else
        local action = ActionCodec:decodeAction(argument)
        ExternalActionHandler(
            nil,
            self,
            runtime.log:subLogger("ExtAction")
        ):handle(action)
    end
end
function PluginBase.prototype.showDialog(self, dialog)
    self.eventHandler:handleProtectedEvent(
        "ShowDialog",
        function()
            self:getRuntime().dialogStack:newStack(self.displayHandle, dialog)
        end
    )
end
function PluginBase.prototype.dialogAction(self, action)
    self.eventHandler:handleProtectedEvent(
        "DialogAction",
        function()
            self:getRuntime().dialogStack:action(action)
        end
    )
end
function PluginBase.prototype.isInstalled(self)
    return self._installer:isInstalled()
end
function PluginBase.prototype.getInstanceIds(self)
    if not self.needsInstall then
        error("Plugin with no install can not have instances")
    end
    local da = self:internalDataAccess()
    if da:read() then
        return objectKeys(
            nil,
            da:getData().instances
        )
    else
        return {}
    end
end
function PluginBase.prototype.install(self, displayHandle, userData)
    if not self.needsInstall then
        error("Plugin with no install")
    end
    local ____temp_6 = self.eventHandler:handleInstallEvent(function(____, undo, subPoolRegistryData, log)
        return self._installer:install(
            undo,
            displayHandle,
            __TS__New(
                SubPoolRegistry,
                {
                    eventEmitter = self:getRuntime().pluginRegistry.eventDispatcher,
                    pluginId = self.pu.pluginId,
                    data = subPoolRegistryData,
                    log = log,
                    readOnly = false
                }
            ),
            log
        )
    end)
    local success = ____temp_6.success
    local oldPluginId = ____temp_6.oldPluginId
    if success then
        local oldPluginId = self.eventHandler:handleInitUserDataEvent(function(____, pluginData)
            if userData == nil then
                local result = self._installer:getOldUserDataWithDialogV1()
                if result == nil then
                    pluginData.userData = self:createDefaultUserData()
                else
                    local userData = result.userData
                    local oldPluginId = result.oldPluginId
                    local oldVersion = result.oldVersion
                    pluginData.userData = userData
                    return oldPluginId
                end
            else
                pluginData.userData = userData
            end
        end)
        return self.eventHandler:handlePluginEvent(
            "Post Install",
            function(____, context)
                return self:onInstall(context, oldPluginId)
            end
        )
    end
end
function PluginBase.prototype.getMigratedOldUserData(self)
    return self._installer:getOldUserData()
end
function PluginBase.prototype.uninstall(self, displayHandle, hardUninstall)
    if not self.needsInstall then
        error("Plugin with no install")
    end
    self.eventHandler:handleUninstallEvent(
        "Uninstall",
        function(____, undo, log)
            local ____self_9 = self._installer
            local ____self_9_uninstall_10 = ____self_9.uninstall
            local ____array_8 = __TS__SparseArrayNew(undo, displayHandle, log)
            local ____temp_7
            if hardUninstall == nil then
                ____temp_7 = false
            else
                ____temp_7 = hardUninstall
            end
            __TS__SparseArrayPush(____array_8, ____temp_7)
            ____self_9_uninstall_10(
                ____self_9,
                __TS__SparseArraySpread(____array_8)
            )
        end
    )
end
function PluginBase.prototype.showAlertDialog(self, title, message)
    showAlert(nil, self.options.displayHandle.index, (self.pu.pluginEnv.pluginName .. ": ") .. title, message)
end
function PluginBase.prototype.provisionInstance(self, instanceConfig, onProvisioned)
    if not self.needsInstall then
        error("Plugin with no install can not have instances")
    end
    self.eventHandler:handlePluginEvent(
        "Provision Instance",
        function(____, context)
            local instanceId = context.instanceManager:provisionNewInstance(self:createInitialInstanceData(instanceConfig, context.pluginData, context.of, context.mainAssetManager))
            onProvisioned(
                nil,
                context:buildInstanceContext(instanceId)
            )
        end
    )
end
function PluginBase.prototype.getRuntime(self)
    return self.options.runtime
end
function PluginBase.prototype.deleteInstance(self, context, instanceId)
    if not self.needsInstall then
        error("Plugin with no install can not have instances")
    end
    local ____context_11 = context
    local undo = ____context_11.undo
    local pu = ____context_11.pu
    local pluginRuntime = ____context_11.pluginRuntime
    local ____pluginRuntime_12 = pluginRuntime
    local log = ____pluginRuntime_12.log
    local ____pu_13 = pu
    local pluginId = ____pu_13.pluginId
    local pluginHandle = ____pu_13.pluginHandle
    pluginRuntime:deleteInstanceRuntime(instanceId)
    self:onInstanceDelete(context, instanceId)
    context.mainAssetManager:getInstanceAssetManager(instanceId):deleteAll(undo)
    context.instanceManager:deleteInstance(instanceId)
end
function PluginBase.prototype.setLogLevel(self, logLevel)
    self:getRuntime():setLogLevel(logLevel)
end
function PluginBase.prototype.getLogLevel(self)
    return self:getRuntime():getLogLevel()
end
function PluginBase.prototype.handlePluginEvent(self, eventName, action, options)
    return self.eventHandler:handlePluginEvent(eventName, action, options)
end
function PluginBase.prototype.handleInstanceEvent(self, eventName, instanceId, action, options)
    return self.eventHandler:handleInstanceEvent(eventName, instanceId, action, options)
end
function PluginBase.prototype.handlePluginEventReadOnly(self, eventName, action, options)
    return self.eventHandler:handlePluginEventReadOnly(eventName, action, options)
end
function PluginBase.prototype.handleInstanceEventReadOnly(self, eventName, instanceId, action, options)
    return self.eventHandler:handleInstanceEventReadOnly(eventName, instanceId, action, options)
end
return ____exports
 end,
["plugins.MidiEncoders.src.types.pluginDataTypes"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["plugins.MidiEncoders.src.types.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["plugins.MidiEncoders.src.data.UserDataWrapper"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local ____InstanceUserDataWrapper = require("plugins.MidiEncoders.src.data.InstanceUserDataWrapper")
local InstanceUserDataWrapper = ____InstanceUserDataWrapper.InstanceUserDataWrapper
function ____exports.UserDataWrapper(self, userData, log, of, readOnly, pam, subPoolRegistry)
    local ____userData_0 = userData
    local pluginConfig = ____userData_0.config
    return {
        getNumOfInstances = function(self)
            return #objectKeys(nil, userData.instances)
        end,
        getInstanceIds = function(self)
            return objectKeys(nil, userData.instances)
        end,
        getInstances = function(self)
            return __TS__ArrayMap(
                self:getInstanceIds(),
                function(____, instanceId) return self:instance(instanceId) end
            )
        end,
        instance = function(self, instanceId)
            return InstanceUserDataWrapper(
                nil,
                self,
                instanceId,
                of,
                log,
                readOnly,
                pam:getInstanceAssetManager(instanceId),
                subPoolRegistry
            )
        end,
        instanceData = function(self, instanceId)
            return userData.instances[instanceId]
        end,
        setInstanceConfig = function(self, instanceId, config)
            local ____config_1 = config
            userData.instances[instanceId].config = ____config_1
            return ____config_1
        end
    }
end
return ____exports
 end,
["plugins.MidiEncoders.src.data.InstanceUserDataWrapper"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.InstanceUserDataWrapper(self, userDataWrapper, instanceId, of, log, readOnly, instanceAssetManager, subPoolRegistry)
    local userData = userDataWrapper:instanceData(instanceId)
    return {getConfig = function(self)
        return userData.config
    end}
end
return ____exports
 end,
["plugins.MidiEncoders.src.data.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____InstanceUserDataWrapper = require("plugins.MidiEncoders.src.data.InstanceUserDataWrapper")
    local InstanceUserDataWrapper = ____InstanceUserDataWrapper.InstanceUserDataWrapper
    ____exports.InstanceUserDataWrapper = InstanceUserDataWrapper
end
do
    local ____UserDataWrapper = require("plugins.MidiEncoders.src.data.UserDataWrapper")
    local UserDataWrapper = ____UserDataWrapper.UserDataWrapper
    ____exports.UserDataWrapper = UserDataWrapper
end
return ____exports
 end,
["plugins.MidiEncoders.src.EventHandler"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.EventHandler(self, log)
    return {}
end
return ____exports
 end,
["plugins.MidiEncoders.src.__imagesB64.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.images = {}
return ____exports
 end,
["plugins.MidiEncoders.src.types.externalActions"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["plugins.MidiEncoders.src.types.types"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["plugins.MidiEncoders.src.AssetTypes"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.AssetTypes = {encoderRotateMacro = function(self, encoderNumber, midiValue)
    return (("encoder" .. tostring(encoderNumber)) .. "MidiValue") .. tostring(midiValue)
end}
return ____exports
 end,
["plugins.MidiEncoders.src.ContextBuilder"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____plugin = require("lib.plugin.index")
local ContextBuilderBase = ____plugin.ContextBuilderBase
local ____data = require("plugins.MidiEncoders.src.data.index")
local UserDataWrapper = ____data.UserDataWrapper
local ____EventHandler = require("plugins.MidiEncoders.src.EventHandler")
local EventHandler = ____EventHandler.EventHandler
local ______imagesB64 = require("plugins.MidiEncoders.src.__imagesB64.index")
local builtInImages = ______imagesB64.images
function ____exports.ContextBuilder(self, pu, displayHandle, runtime)
    local function enrichPluginContext(self, context)
        return __TS__ObjectAssign(
            {},
            context,
            {
                userDataWrapper = UserDataWrapper(
                    nil,
                    context.pluginData.userData,
                    runtime.log,
                    context.of,
                    false,
                    context.mainAssetManager,
                    context.subPoolRegistry
                ),
                actions = EventHandler(nil, runtime.log)
            }
        )
    end
    local function enrichPluginContextReadOnly(self, context)
        local ____context_0 = context
        local pluginData = ____context_0.pluginData
        local log = ____context_0.log
        local of = ____context_0.of
        local mainAssetManager = ____context_0.mainAssetManager
        return __TS__ObjectAssign(
            {},
            context,
            {userDataWrapper = UserDataWrapper(
                nil,
                pluginData.userData,
                log,
                of,
                true,
                mainAssetManager,
                context.subPoolRegistry
            )}
        )
    end
    local function enrichInstanceContextReadOnly(self, context)
        local ____context_1 = context
        local pluginData = ____context_1.pluginData
        local log = ____context_1.log
        local of = ____context_1.of
        local mainAssetManager = ____context_1.mainAssetManager
        local userDataWrapper = UserDataWrapper(
            nil,
            pluginData.userData,
            log,
            of,
            true,
            mainAssetManager,
            context.subPoolRegistry
        )
        return __TS__ObjectAssign(
            {},
            context,
            {
                userDataWrapper = userDataWrapper,
                instanceDataWrapper = userDataWrapper:instance(context.instanceId)
            }
        )
    end
    local function enrichInstanceContext(self, context)
        local ____context_2 = context
        local of = ____context_2.of
        local log = runtime.log
        return __TS__ObjectAssign(
            {},
            context,
            {
                actions = EventHandler(nil, log),
                instanceUserDataWrapper = UserDataWrapper(
                    nil,
                    context.pluginData.userData,
                    log,
                    of,
                    false,
                    context.mainAssetManager,
                    context.subPoolRegistry
                ):instance(context.instanceId),
                userDataWrapper = UserDataWrapper(
                    nil,
                    context.pluginData.userData,
                    log,
                    of,
                    false,
                    context.mainAssetManager,
                    context.subPoolRegistry
                ),
                pluginConfig = context.pluginData.userData.config
            }
        )
    end
    return __TS__New(ContextBuilderBase, {
        pu = pu,
        componentNumber = 1,
        builtInImages = builtInImages,
        enrichPluginContextReadOnly = enrichPluginContextReadOnly,
        enrichInstanceContextReadOnly = enrichInstanceContextReadOnly,
        enrichInstanceContext = enrichInstanceContext,
        enrichPluginContext = enrichPluginContext,
        displayHandle = displayHandle,
        runtime = runtime
    })
end
return ____exports
 end,
["plugins.MidiEncoders.src.DataMigrations"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.userDataMigrations = {
    {
        fromPluginId = "pro_plugins__midi_encoders__v1_0_1",
        fromVersion = "1.0.1",
        toPluginId = "pro_plugins__midi_encoders__v1_0_2",
        migrateUserData = function(____, oldUserData)
            return oldUserData
        end
    },
    {
        fromPluginId = "pro_plugins__midi_encoders__v1_0_2",
        fromVersion = "1.0.2",
        toPluginId = "pro_plugins__midi_encoders__v1_1_0",
        migrateUserData = function(____, oldUserData)
            return oldUserData
        end
    },
    {
        fromPluginId = "pro_plugins__midi_encoders__v1_1_0",
        fromVersion = "1.1.0",
        toPluginId = "pro_plugins__midi_encoders__v1_1_1",
        migrateUserData = function(____, oldUserData)
            return oldUserData
        end
    },
    {
        fromPluginId = "pro_plugins__midi_encoders__v1_1_1",
        fromVersion = "1.1.1",
        toPluginId = "pro_plugins__midi_encoders__v1_1_2",
        migrateUserData = function(____, oldUserData)
            return oldUserData
        end
    }
}
return ____exports
 end,
["plugins.MidiEncoders.src.EncoderLocator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local getRect, getArrangementModeEncoder, LAYOUT_BAR_POSITION_ENCODER_OBJ_MAP
function getRect(self, obj)
    return obj:Get("AbsClientRect")
end
function getArrangementModeEncoder(self, innerBoxLower, encoderNumber)
    if encoderNumber == 5 or encoderNumber == 10 then
        return getRect(nil, innerBoxLower[encoderNumber == 5 and "Encoder5aScr" or "Encoder5bScr"])
    end
    if innerBoxLower["Arrangement" .. tostring(encoderNumber % 5)]:Get("visible") then
        return getRect(
            nil,
            innerBoxLower["Arrangement" .. tostring(encoderNumber % 5)]
        )
    else
        if encoderNumber % 5 <= 3 then
            return getRect(
                nil,
                innerBoxLower[("ArrangementSplit" .. (encoderNumber > 5 and "Outer" or "Inner")) .. tostring(encoderNumber % 5)]
            )
        end
    end
end
--- This wheel center offset of 35 is fixed also in these cases:
-- displayRatio is different (checked 1.0, 0.75)
local WHEEL_CENTER_OFFSET_X = 35
local LayoutBarEncoderFunction = LayoutBarEncoderFunction or ({})
LayoutBarEncoderFunction.Position = 0
LayoutBarEncoderFunction[LayoutBarEncoderFunction.Position] = "Position"
LayoutBarEncoderFunction.Arrangement = 1
LayoutBarEncoderFunction[LayoutBarEncoderFunction.Arrangement] = "Arrangement"
function ____exports.EncoderLocator(self, log)
    local getEncoderWheelCenter, getEncoderPlaceCenter, getEncoderRect, getEncoderRectPresetBar, getEncoderRectLayoutBar, getEncoderRectStageViewBar, getEncoderRectTimecodeBar
    function getEncoderWheelCenter(self, encoderNumber)
        local rect = getEncoderRect(nil, encoderNumber)
        if rect == nil then
            return nil
        else
            return {x = rect.x + WHEEL_CENTER_OFFSET_X, y = rect.y + rect.h / 2}
        end
    end
    function getEncoderPlaceCenter(self, encoderNumber)
        local rect = getEncoderRect(nil, encoderNumber)
        if rect == nil then
            return nil
        else
            return {x = rect.x + rect.w / 2, y = rect.y + rect.h / 2}
        end
    end
    function getEncoderRect(self, encoderNumber)
        local displayNumber = 1
        local display = GetDisplayByIndex(displayNumber)
        local encoderBar = display.EncoderBarContainer.EncoderBar
        local presetBar = encoderBar["PresetBar 3"]
        local layoutBar = encoderBar["LayoutBar 3"]
        local stageViewBar = encoderBar["StageViewBar 3"]
        local timecodeBar = encoderBar["TimecodeBar 3"]
        if presetBar ~= nil then
            return getEncoderRectPresetBar(nil, presetBar, encoderNumber)
        elseif layoutBar ~= nil then
            return getEncoderRectLayoutBar(nil, layoutBar, encoderNumber)
        elseif stageViewBar ~= nil then
            return getEncoderRectStageViewBar(nil, stageViewBar, encoderNumber)
        elseif timecodeBar ~= nil then
            return getEncoderRectTimecodeBar(nil, timecodeBar, encoderNumber)
        else
            log:warn(("Could not detect encoders bar type: EncoderBarContainer.Children = [" .. table.concat(
                __TS__ArrayMap(
                    encoderBar:Children(),
                    function(____, c) return c.name end
                ),
                ","
            )) .. "]")
            return
        end
    end
    function getEncoderRectPresetBar(self, presetBar, encoderNumber)
        local encoderPlace = presetBar.EncodersArea["EncoderPlace" .. tostring((encoderNumber - 1) % 5 + 1)]
        local encoderGrid1 = encoderPlace["UILayoutGrid 3"]
        local encoderGrid2 = encoderPlace["UILayoutGrid 4"]
        local function getScreenEncoderWheel(self, encoderGrid)
            local encoder = encoderGrid[3]
            if encoder:GetClass() == "ScreenEncoderControl" then
                return encoder:Get("AbsClientRect")
            else
                log:warn("Could not detect screen encoders. encoderGrid1[3].GetClass() = " .. encoderGrid1[3]:GetClass())
                return
            end
        end
        if encoderNumber == 5 then
            return getScreenEncoderWheel(nil, encoderGrid1)
        elseif encoderNumber == 10 then
            Echo("encoderNumber=" .. tostring(encoderNumber))
            return getScreenEncoderWheel(nil, encoderGrid2)
        end
        if encoderGrid1[5]:GetClass() == "EncoderControl" then
            return
        end
        if encoderGrid1[5]:GetClass() == "PresetEncoderControl" then
            local encoderGrid1ThirdChild = encoderGrid1[3]
            if encoderGrid1ThirdChild:GetClass() == "SwipeButtonList" then
            end
            local encoderGrid2ThirdChild = encoderGrid2[3]
            local encoderGrid1_5Child = encoderGrid1[5]
            local encoderGrid2_5Child = encoderGrid2[5]
            local encoderGrid1Rect = encoderGrid1:Get("AbsClientRect")
            local swipeButtonWidth = encoderGrid1ThirdChild:Get("AbsClientRect").w
            return {x = encoderGrid1Rect.x + swipeButtonWidth, y = encoderGrid1Rect.y, w = encoderGrid1Rect.w, h = encoderGrid1Rect.h}
        else
            log:warn(("Could not detect encoderPlace type. encoderGrid1 child classes: [" .. __TS__ArrayJoin(
                __TS__ArrayMap(
                    encoderGrid1:Children(),
                    function(____, c) return c.GetClass end
                ),
                ","
            )) .. "]")
            return
        end
    end
    function getEncoderRectLayoutBar(self, layoutBar, encoderNumber)
        log:trace("LayoutView")
        local innerBoxLower = layoutBar.InnerBox.Lower
        local encoderFunction = layoutBar.InnerBox.EncoderFunction:Get("SELECTEDITEMIDX")
        repeat
            local ____switch29 = encoderFunction
            local ____cond29 = ____switch29 == LayoutBarEncoderFunction.Position
            if ____cond29 then
                do
                    local encoderObj = innerBoxLower[LAYOUT_BAR_POSITION_ENCODER_OBJ_MAP[encoderNumber]]
                    return getRect(nil, encoderObj)
                end
            end
            ____cond29 = ____cond29 or ____switch29 == LayoutBarEncoderFunction.Arrangement
            if ____cond29 then
                do
                    return getArrangementModeEncoder(nil, innerBoxLower, encoderNumber)
                end
            end
        until true
    end
    function getEncoderRectStageViewBar(self, stageViewBar, encoderNumber)
        log:trace("StageView")
        local innerBoxLower = stageViewBar.InnerBox.Lower
        return getArrangementModeEncoder(nil, innerBoxLower, encoderNumber)
    end
    function getEncoderRectTimecodeBar(self, timecodeBar, encoderNumber)
        log:trace("Timecode")
        local innerBoxLower = timecodeBar.InnerBox.Lower
        if encoderNumber == 5 or encoderNumber == 10 then
            return getRect(nil, innerBoxLower[("Encoder5" .. (encoderNumber == 5 and "a" or "b")) .. "Scr"])
        else
            return getRect(
                nil,
                innerBoxLower[("Encoder" .. tostring(encoderNumber % 5)) .. (encoderNumber <= 5 and "a" or "b")]
            )
        end
    end
    return {
        getEncoderWheelCenter = getEncoderWheelCenter,
        getEncoderPlaceCenter = getEncoderPlaceCenter,
        getEncodersDisplayNumber = function() return 1 end
    }
end
LAYOUT_BAR_POSITION_ENCODER_OBJ_MAP = {
    [1] = "TransX",
    [2] = "TransY",
    [3] = "ScaleAll",
    [4] = "RotZ",
    [5] = "Encoder5aScr",
    [6] = "ScaleX",
    [7] = "ScaleY",
    [8] = "RatioAll",
    [9] = "RotZ",
    [10] = "Encoder5bScr"
}
return ____exports
 end,
["plugins.MidiEncoders.src.__env"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____PluginEnv = require("lib.plugin.PluginEnv")
local PluginEnv = ____PluginEnv.PluginEnv
____exports.PLUGIN_ENV = __TS__New(PluginEnv, {
    env = "prod",
    pluginName = "MIDI Encoders",
    pluginId = "pro_plugins__midi_encoders__v1_1_2",
    pluginVersion = "1.1.2",
    author = "Pro Plugins"
})
return ____exports
 end,
["plugins.MidiEncoders.src.common"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ______env = require("plugins.MidiEncoders.src.__env")
local PLUGIN_ENV = ______env.PLUGIN_ENV
local MIDI_REMOTE_NAME_PREFIX = PLUGIN_ENV.pluginId
function ____exports.createMidiRemoteNameInstancePrefix(self, instanceId)
    return (MIDI_REMOTE_NAME_PREFIX .. " I") .. instanceId
end
function ____exports.createMidiRemoteName(self, instanceId, tag)
    return (____exports.createMidiRemoteNameInstancePrefix(nil, instanceId) .. " ") .. tag
end
function ____exports.clearAllRemotes(self, of)
    for ____, remote in ipairs(__TS__ArrayReverse(of:HMidiRemotes():getRemotes())) do
        if __TS__StringStartsWith(remote.name, MIDI_REMOTE_NAME_PREFIX) then
            remote:unlock()
            remote:delete()
        end
    end
end
____exports.INNER_OUTER_INVERSION_MOMENTARY_BUTTON_ID = "setInnerOuter"
--- There are 5 physical encoder, each of them with inner and outer encoders.
-- This is the max number of encoder that can appear on the screen.
-- It does not matter if we you 5 or 10 midi encoders.
____exports.NUM_OF_ENCODERS = 10
return ____exports
 end,
["plugins.MidiEncoders.src.defaultConfig"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ______env = require("plugins.MidiEncoders.src.__env")
local PLUGIN_ENV = ______env.PLUGIN_ENV
local MAX_MACRO_CAPACITY = 400
____exports.PLUGIN_ASSETS_MAX_CAPACITY = {Macros = MAX_MACRO_CAPACITY, Pages = 1, Sequences = 10}
____exports.DEFAULT_RELATIVE_MODE = "Mode2-offset"
function ____exports.createDefaultConfig(self)
    if PLUGIN_ENV.env == "dev" then
        return {
            enabled = true,
            rotateDirection = "normal",
            maxAmount = 10,
            defaultMidiChannel = 11,
            midiRelativeMode = "Mode2-offset",
            midiMappings = {
                encoder1Rotate = {enabled = true, midiType = "Control", midiChannel = 11, midiIndex = 11},
                encoder2Rotate = {enabled = true, midiType = "Control", midiChannel = 11, midiIndex = 12},
                encoder3Rotate = {enabled = true, midiType = "Control", midiChannel = 11, midiIndex = 13},
                encoder4Rotate = {enabled = true, midiType = "Control", midiChannel = 11, midiIndex = 14},
                encoder5Rotate = {enabled = true, midiType = "Control", midiChannel = 11, midiIndex = 15},
                encoder1Click = {enabled = true, midiType = "Note", midiChannel = 11, midiIndex = 24},
                encoder2Click = {enabled = true, midiType = "Note", midiChannel = 11, midiIndex = 25},
                encoder3Click = {enabled = true, midiType = "Note", midiChannel = 11, midiIndex = 26},
                encoder4Click = {enabled = true, midiType = "Note", midiChannel = 11, midiIndex = 27},
                encoder5Click = {enabled = true, midiType = "Note", midiChannel = 11, midiIndex = 28},
                toggleInnerOuterIndex = {enabled = true, midiType = "Note", midiChannel = 11, midiIndex = 40}
            }
        }
    else
        return {
            enabled = true,
            rotateDirection = "normal",
            maxAmount = 10,
            defaultMidiChannel = 1,
            midiRelativeMode = "Mode1-2comp",
            midiMappings = {
                encoder1Rotate = {enabled = true, midiType = "Control", midiChannel = 1, midiIndex = 1},
                encoder2Rotate = {enabled = true, midiType = "Control", midiChannel = 1, midiIndex = 2},
                encoder3Rotate = {enabled = true, midiType = "Control", midiChannel = 1, midiIndex = 3},
                encoder4Rotate = {enabled = true, midiType = "Control", midiChannel = 1, midiIndex = 4},
                encoder5Rotate = {enabled = true, midiType = "Control", midiChannel = 1, midiIndex = 5},
                encoder1Click = {enabled = true, midiType = "Note", midiChannel = 1, midiIndex = 11},
                encoder2Click = {enabled = true, midiType = "Note", midiChannel = 1, midiIndex = 12},
                encoder3Click = {enabled = true, midiType = "Note", midiChannel = 1, midiIndex = 13},
                encoder4Click = {enabled = true, midiType = "Note", midiChannel = 1, midiIndex = 14},
                encoder5Click = {enabled = true, midiType = "Note", midiChannel = 1, midiIndex = 15},
                toggleInnerOuterIndex = {enabled = true, midiType = "Note", midiChannel = 1, midiIndex = 21}
            }
        }
    end
end
function ____exports.createEmptyUserData(self)
    return {config = {}, pluginState = {}, instances = {}}
end
return ____exports
 end,
["plugins.MidiEncoders.src.ExecutorToggle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.ExecutorToggle(self, params)
    local getSeq, createMacroAssetType, generate, addMidiRemotes, assetManager, macrosAssetTypePrefix, actionName, actionValueLabel, log, of
    function getSeq(self)
        return assetManager.provisionOrGet:sequence(macrosAssetTypePrefix .. "_Seq")
    end
    function createMacroAssetType(self, action)
        local assetType = ((macrosAssetTypePrefix .. "_") .. action) .. "_Macro"
        return assetType
    end
    function generate(self, genParams)
        local ____genParams_1 = genParams
        local createCommand = ____genParams_1.createCommand
        local pressMacro = assetManager.provisionOrGet:macro(createMacroAssetType(nil, "press")):store({label = (actionName .. " ") .. actionValueLabel(nil, "press")}):setLines({{command = createCommand(nil, "press")}})
        local releaseMacro = assetManager.provisionOrGet:macro(createMacroAssetType(nil, "release")):store({label = (actionName .. " ") .. actionValueLabel(nil, "release")}):setLines({{command = createCommand(nil, "release")}})
        Cmd("ClearAll")
        local seq = getSeq(nil):store({label = actionName, mode = "Overwrite"})
        seq:storeCue(1, {mode = "Overwrite"}):setLabel(actionValueLabel(nil, "press")):setProps({command = pressMacro.addr})
        seq:getOffCue():setProps({command = releaseMacro.addr})
    end
    function addMidiRemotes(self, midiMapping, enabled, finalize)
        local ____midiMapping_2 = midiMapping
        local midiChannel = ____midiMapping_2.midiChannel
        local midiIndex = ____midiMapping_2.midiIndex
        local midiType = ____midiMapping_2.midiType
        local remote = of:HMidiRemotes():addRemote()
        if midiType ~= "Note" then
            log:warn(("ExecutorToggle for action " .. actionName) .. ": midiType must be \"Note\"")
        end
        local seq = getSeq(nil)
        remote:setProps({
            enabled = enabled,
            midiChannel = midiChannel,
            midiIndex = midiIndex,
            midiType = midiType,
            key = "Flash"
        }):setTarget(seq)
        if finalize ~= nil then
            finalize(nil, remote)
        end
    end
    local ____params_0 = params
    assetManager = ____params_0.assetManager
    macrosAssetTypePrefix = ____params_0.assetTypePrefix
    actionName = ____params_0.actionName
    actionValueLabel = ____params_0.actionValueLabel
    log = ____params_0.log
    of = ____params_0.of
    return {generate = generate, addMidiRemotes = addMidiRemotes}
end
return ____exports
 end,
["plugins.MidiEncoders.src.RelativeMidiMap"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
--- NOTE: MA3 ignores CC with value 0 ! (Even if TriggerOn is 0)
-- In Mode-1 and Mode-3 this is not an issue, because CC with value 0 means 0 amount.
-- But in Mode-2, CC with 0 means amount -64 which wlil be ignored. Which is... a non-issue.
local function createRelativeMidiMaps(self, midiRelativeMode, maxAmount)
    repeat
        local ____switch3 = midiRelativeMode
        local ____cond3 = ____switch3 == "Mode1-2comp"
        if ____cond3 then
            do
                local midiValueToAmount = {}
                local amountToMidiValue = {}
                do
                    local amount = 0
                    while amount <= math.min(maxAmount, 63) do
                        midiValueToAmount[amount] = amount
                        midiValueToAmount[128 - amount] = -amount
                        amountToMidiValue[amount] = amount
                        amountToMidiValue[-amount] = 128 - amount
                        amount = amount + 1
                    end
                end
                return {midiValueToAmount = midiValueToAmount, amountToMidiValue = amountToMidiValue}
            end
        end
        ____cond3 = ____cond3 or ____switch3 == "Mode2-offset"
        if ____cond3 then
            do
                local midiValueToAmount = {}
                local amountToMidiValue = {}
                do
                    local amount = 1
                    while amount <= math.min(maxAmount, 63) do
                        midiValueToAmount[64 + amount] = amount
                        midiValueToAmount[64 - amount] = -amount
                        amountToMidiValue[amount] = 64 + amount
                        amountToMidiValue[-amount] = 64 - amount
                        amount = amount + 1
                    end
                end
                return {midiValueToAmount = midiValueToAmount, amountToMidiValue = amountToMidiValue}
            end
        end
        ____cond3 = ____cond3 or ____switch3 == "Mode3-SignBit"
        if ____cond3 then
            do
                local midiValueToAmount = {}
                local amountToMidiValue = {}
                do
                    local amount = 0
                    while amount <= math.min(maxAmount, 63) do
                        midiValueToAmount[amount] = amount
                        midiValueToAmount[64 + amount] = -amount
                        amountToMidiValue[amount] = amount
                        amountToMidiValue[-amount] = 64 + amount
                        amount = amount + 1
                    end
                end
                return {midiValueToAmount = midiValueToAmount, amountToMidiValue = amountToMidiValue}
            end
        end
        do
            do
                error("unsupported MidiRelativeMode")
            end
        end
    until true
end
--- Maps value as string to an amount
____exports.RELATIVE_MIDI_MODES = {
    ["Mode1-2comp"] = createRelativeMidiMaps(nil, "Mode1-2comp", 63),
    ["Mode2-offset"] = createRelativeMidiMaps(nil, "Mode2-offset", 63),
    ["Mode3-SignBit"] = createRelativeMidiMaps(nil, "Mode3-SignBit", 63)
}
return ____exports
 end,
["plugins.MidiEncoders.src.TempGlobalVariableFactory"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
function ____exports.TempGlobalVariableFactory(self, pluginId)
    local encoder, momentaryButton, varPrefix
    function encoder(self, encoderNumber, instanceId)
        return ((varPrefix .. instanceId) .. "_enc") .. tostring(encoderNumber)
    end
    function momentaryButton(self, buttonId, instanceId)
        return ((varPrefix .. instanceId) .. "_button") .. buttonId
    end
    varPrefix = ("TEMP__" .. pluginId) .. "__"
    return {encoder = encoder, momentaryButton = momentaryButton}
end
return ____exports
 end,
["plugins.MidiEncoders.src.Generator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Utils = require("lib.Utils")
local series = ____Utils.series
local ____AssetTypes = require("plugins.MidiEncoders.src.AssetTypes")
local AssetTypes = ____AssetTypes.AssetTypes
local ____common = require("plugins.MidiEncoders.src.common")
local clearAllRemotes = ____common.clearAllRemotes
local ____ExecutorToggle = require("plugins.MidiEncoders.src.ExecutorToggle")
local ExecutorToggle = ____ExecutorToggle.ExecutorToggle
local ____RelativeMidiMap = require("plugins.MidiEncoders.src.RelativeMidiMap")
local RELATIVE_MIDI_MODES = ____RelativeMidiMap.RELATIVE_MIDI_MODES
local ____TempGlobalVariableFactory = require("plugins.MidiEncoders.src.TempGlobalVariableFactory")
local TempGlobalVariableFactory = ____TempGlobalVariableFactory.TempGlobalVariableFactory
function ____exports.Generator(self, context)
    local generate, generateEncoderRotateMacros, deleteEncoderRotateMacros, updateMidiRemotes, addMidiRemotes, generateToggleInnerOuterInversion, createEncoderRotateMacros, createEncoderClickMacro, finalizeRemote, addMidiRemotesForEncoder, updateMidiRemotesForEncoderRotate, updateMidiRemotesForEncoderClick, generateFixedAmountMacroExamples, config, encoderNumbers, innerOuterToggleButton
    function generate(self)
        generateFixedAmountMacroExamples(nil)
        __TS__ArrayForEach(
            encoderNumbers,
            function(____, encoderNumber)
                createEncoderClickMacro(nil, encoderNumber)
            end
        )
        generateEncoderRotateMacros(nil)
        generateToggleInnerOuterInversion(nil)
        addMidiRemotes(nil)
    end
    function generateEncoderRotateMacros(self)
        __TS__ArrayForEach(
            encoderNumbers,
            function(____, encoderNumber)
                if config.midiMappings[("encoder" .. tostring(encoderNumber)) .. "Rotate"].enabled then
                    createEncoderRotateMacros(nil, encoderNumber)
                end
            end
        )
    end
    function deleteEncoderRotateMacros(self)
        local im = context.instanceAssetManager
        __TS__ArrayForEach(
            encoderNumbers,
            function(____, encoderNumber)
                local rotateAssetType = ("encoder" .. tostring(encoderNumber)) .. "Rotate"
                if im:isProvisioned(rotateAssetType, "Macros", 1) then
                    im:delete(context.undo, "Macros", rotateAssetType)
                end
                do
                    local midiValue = 0
                    while midiValue <= 127 do
                        local assetType = AssetTypes:encoderRotateMacro(encoderNumber, midiValue)
                        if im:isProvisioned(assetType, "Macros", 1) then
                            im:delete(context.undo, "Macros", assetType)
                        end
                        midiValue = midiValue + 1
                    end
                end
            end
        )
    end
    function updateMidiRemotes(self)
        clearAllRemotes(nil, context.of)
        deleteEncoderRotateMacros(nil)
        generateEncoderRotateMacros(nil)
        addMidiRemotes(nil)
    end
    function addMidiRemotes(self)
        __TS__ArrayForEach(
            encoderNumbers,
            function(____, encoderNumber)
                addMidiRemotesForEncoder(nil, encoderNumber)
            end
        )
        if config.enabled and config.midiMappings.toggleInnerOuterIndex.enabled then
            innerOuterToggleButton:addMidiRemotes(
                config.midiMappings.toggleInnerOuterIndex,
                config.enabled,
                function(____, remote) return finalizeRemote(nil, remote, "toggle") end
            )
        end
    end
    function generateToggleInnerOuterInversion(self)
        innerOuterToggleButton:generate({createCommand = function(____, action) return context.externalActionCommandFactory:create({type = "setInnerOuterInvertion", params = {instanceId = context.instanceId, state = action == "press" and "inverted" or "normal"}}) end})
    end
    function createEncoderRotateMacros(self, encoderNumber)
        local ____context_1 = context
        local instanceId = ____context_1.instanceId
        local maxAmount = config.maxAmount
        local midiRelativeMode = config.midiRelativeMode
        local relativeMidiMaps = RELATIVE_MIDI_MODES[midiRelativeMode]
        local rotateMacro = context.instanceAssetManager.provisionOrGet:macro(("encoder" .. tostring(encoderNumber)) .. "Rotate")
        rotateMacro:store({label = ("Encoder " .. tostring(encoderNumber)) .. " Rotate "}):setLines({{command = context.externalActionCommandFactory:create({type = "encoderRotateAction", params = {instanceId = instanceId, encoderNumber = encoderNumber}})}})
        local function createSetMidiValueMacro(self, amount)
            local midiValue = relativeMidiMaps.amountToMidiValue[amount]
            local macro = context.instanceAssetManager.provisionOrGet:macro(AssetTypes:encoderRotateMacro(encoderNumber, midiValue))
            macro:store({label = (("Encoder " .. tostring(encoderNumber)) .. " val ") .. tostring(midiValue)}):setLines({{command = ((("LUA \"" .. TempGlobalVariableFactory(nil, context.pu.pluginId):encoder(encoderNumber, instanceId)) .. "=") .. tostring(midiValue)) .. "\""}})
            return macro
        end
        do
            local amount = 1
            while amount <= maxAmount do
                createSetMidiValueMacro(nil, amount)
                createSetMidiValueMacro(nil, -amount)
                amount = amount + 1
            end
        end
    end
    function createEncoderClickMacro(self, encoderNumber)
        local ____context_2 = context
        local instanceId = ____context_2.instanceId
        local macro = context.instanceAssetManager.provisionOrGet:macro(("encoder" .. tostring(encoderNumber)) .. "Click")
        macro:store({label = ("Encoder " .. tostring(encoderNumber)) .. " Click"}):setLines({{command = context.externalActionCommandFactory:create({type = "encoderClickAction", params = {instanceId = instanceId, encoderNumber = encoderNumber}})}})
    end
    function finalizeRemote(self, midiRemote, tag)
        midiRemote:getObj().name = context.midiRemotes:createRemoteName(context.instanceId, tag)
        midiRemote:lock()
    end
    function addMidiRemotesForEncoder(self, encoderNumber)
        updateMidiRemotesForEncoderRotate(nil, encoderNumber)
        updateMidiRemotesForEncoderClick(nil, encoderNumber)
    end
    function updateMidiRemotesForEncoderRotate(self, encoderNumber)
        local midiMappings = config.midiMappings
        local maxAmount = config.maxAmount
        local midiRelativeMode = config.midiRelativeMode
        local pluginEnabled = config.enabled
        local ____midiMappings_index_3 = midiMappings[("encoder" .. tostring(encoderNumber)) .. "Rotate"]
        local _enabled = ____midiMappings_index_3.enabled
        local midiIndex = ____midiMappings_index_3.midiIndex
        local midiChannel = ____midiMappings_index_3.midiChannel
        local enabled = pluginEnabled and _enabled
        if not enabled then
            return
        end
        local rotateMacro = context.instanceAssetManager.get:macro(("encoder" .. tostring(encoderNumber)) .. "Rotate")
        local rotateRemote = context.of:HMidiRemotes():addRemote()
        rotateRemote:setProps({
            enabled = enabled,
            midiChannel = midiChannel,
            midiIndex = midiIndex,
            triggerOn = 0,
            triggerOff = 0,
            midiType = "Control",
            key = "Go+"
        }):setTarget(rotateMacro)
        finalizeRemote(nil, rotateRemote, "rotate")
        local relativeMidiMaps = RELATIVE_MIDI_MODES[midiRelativeMode]
        local function createSetMidiValueRemote(self, midiValue)
            local macro = context.instanceAssetManager.provisionOrGet:macro((("encoder" .. tostring(encoderNumber)) .. "MidiValue") .. tostring(midiValue))
            local midiRemote = context.of:HMidiRemotes():addRemote()
            midiRemote:setProps({
                enabled = enabled,
                midiChannel = midiChannel,
                midiIndex = midiIndex,
                triggerOn = midiValue,
                triggerOff = 0,
                midiType = "Control",
                key = "Go+"
            }):setTarget(macro)
            finalizeRemote(nil, midiRemote, "rotate")
        end
        local midiValues = {}
        do
            local amount = 1
            while amount <= maxAmount do
                midiValues[#midiValues + 1] = relativeMidiMaps.amountToMidiValue[amount]
                midiValues[#midiValues + 1] = relativeMidiMaps.amountToMidiValue[-amount]
                amount = amount + 1
            end
        end
        __TS__ArrayForEach(
            __TS__ArrayReverse(__TS__ArraySort(midiValues)),
            function(____, midiValue)
                createSetMidiValueRemote(nil, midiValue)
            end
        )
    end
    function updateMidiRemotesForEncoderClick(self, encoderNumber)
        local midiMappings = config.midiMappings
        local pluginEnabled = config.enabled
        local ____midiMappings_index_4 = midiMappings[("encoder" .. tostring(encoderNumber)) .. "Click"]
        local _enabled = ____midiMappings_index_4.enabled
        local midiType = ____midiMappings_index_4.midiType
        local midiIndex = ____midiMappings_index_4.midiIndex
        local midiChannel = ____midiMappings_index_4.midiChannel
        local enabled = pluginEnabled and _enabled
        if not enabled then
            return
        end
        local macro = context.instanceAssetManager.get:macro(("encoder" .. tostring(encoderNumber)) .. "Click")
        local remote = context.of:HMidiRemotes():addRemote()
        remote:setProps({
            enabled = enabled,
            midiChannel = midiChannel,
            midiIndex = midiIndex,
            midiType = midiType,
            key = "Go+"
        }):setTarget(macro)
        finalizeRemote(nil, remote, "click")
    end
    function generateFixedAmountMacroExamples(self)
        local createMacro
        function createMacro(self, direction)
            local rotateUpMacro = context.instanceAssetManager.provisionOrGet:macro(("encoderRotate" .. direction) .. "WithAmount")
            rotateUpMacro:store({label = ("Encoder Rotate " .. direction) .. " Template"}):setLines({{command = context.externalActionCommandFactory:create({type = "encoderRotateWithAmountAction", params = {encoderNumber = 1, amount = direction == "Right" and 1 or -1}})}})
        end
        createMacro(nil, "Right")
        createMacro(nil, "Left")
    end
    local ____context_0 = context
    local of = ____context_0.of
    local log = ____context_0.log
    config = context.instanceUserDataWrapper:getConfig()
    encoderNumbers = series(nil, 1, 5)
    innerOuterToggleButton = ExecutorToggle(
        nil,
        {
            assetManager = context.instanceAssetManager,
            assetTypePrefix = "toggleInnerOuter",
            actionValueLabel = function(____, action) return action == "press" and "Encoders Inverted" or "Encoders Normal" end,
            actionName = "Toggle MIDI Encoders Inner/Outer",
            of = of,
            log = log
        }
    )
    return {generate = generate, updateMidiRemotes = updateMidiRemotes}
end
return ____exports
 end,
["plugins.MidiEncoders.src.InstanceCreator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Generator = require("plugins.MidiEncoders.src.Generator")
local Generator = ____Generator.Generator
local function createInstance(self, context)
    Generator(nil, context):generate()
    context.of:HMidiRemotes():getObj().enabled = true
end
____exports.InstanceCreator = {createInstance = createInstance}
return ____exports
 end,
["plugins.MidiEncoders.src.InstanceRuntime"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____InstanceRuntimeBase = require("lib.plugin.InstanceRuntimeBase")
local InstanceRuntimeBase = ____InstanceRuntimeBase.InstanceRuntimeBase
____exports.InstanceRuntime = __TS__Class()
local InstanceRuntime = ____exports.InstanceRuntime
InstanceRuntime.name = "InstanceRuntime"
__TS__ClassExtends(InstanceRuntime, InstanceRuntimeBase)
function InstanceRuntime.prototype.____constructor(self, instanceId, pluginInfo, parentLog, pluginRuntime)
    InstanceRuntimeBase.prototype.____constructor(
        self,
        instanceId,
        pluginInfo,
        parentLog,
        pluginRuntime
    )
    self.innerOuterInvertionState = "normal"
end
function InstanceRuntime.prototype.setConfig(self, config)
    self.config = config
end
function InstanceRuntime.prototype.getConfig(self)
    return self.config
end
function InstanceRuntime.prototype.getInnerOuterInvertion(self)
    return self.innerOuterInvertionState
end
function InstanceRuntime.prototype.setInnerOuterInvertion(self, state)
    self.innerOuterInvertionState = state
end
return ____exports
 end,
["plugins.MidiEncoders.src.Runtime"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Logger = require("lib.Logger")
local LogLevel = ____Logger.LogLevel
local ____plugin = require("lib.plugin.index")
local PluginRuntime = ____plugin.PluginRuntime
local ____Utils = require("lib.Utils")
local objectValues = ____Utils.objectValues
local series = ____Utils.series
local ______env = require("plugins.MidiEncoders.src.__env")
local PLUGIN_ENV = ______env.PLUGIN_ENV
local ____common = require("plugins.MidiEncoders.src.common")
local NUM_OF_ENCODERS = ____common.NUM_OF_ENCODERS
local ____InstanceRuntime = require("plugins.MidiEncoders.src.InstanceRuntime")
local InstanceRuntime = ____InstanceRuntime.InstanceRuntime
____exports.Runtime = __TS__Class()
local Runtime = ____exports.Runtime
Runtime.name = "Runtime"
__TS__ClassExtends(Runtime, PluginRuntime)
function Runtime.prototype.____constructor(self, pluginId, pluginInfo)
    PluginRuntime.prototype.____constructor(self, {pluginId = pluginId, pluginInfo = pluginInfo, pluginEnv = PLUGIN_ENV, logLevel = PLUGIN_ENV.env == "prod" and LogLevel.ERROR or LogLevel.TRACE})
    self.encoderAccumTurnAmountMutex = {}
    self.encoderAccumTurnAmount = {}
    self.encodersTouchMutex = self.mutexFactory:create(self.log:subLogger("Touch"))
    __TS__ArrayForEach(
        series(nil, 1, NUM_OF_ENCODERS),
        function(____, encoderNumber)
            local mutex = self.mutexFactory:create()
            self.encoderAccumTurnAmountMutex[encoderNumber] = mutex
            self.encoderAccumTurnAmount[encoderNumber] = 0
        end
    )
end
function Runtime.prototype.destroy(self)
    PluginRuntime.prototype.destroy(self)
    self.encodersTouchMutex:destroy()
    for ____, mutex in ipairs(objectValues(nil, self.encoderAccumTurnAmountMutex)) do
        mutex:destroy()
    end
end
function Runtime.prototype.onPluginRegistryEvent(self, event)
end
function Runtime.prototype.createInstanceRuntime(self, instanceId, pluginInfo, log)
    return __TS__New(
        InstanceRuntime,
        instanceId,
        pluginInfo,
        log,
        self
    )
end
function Runtime.prototype.getEncoderTouchMutex(self)
    return self.encodersTouchMutex
end
function Runtime.prototype.addToEncoderAccumAmount(self, encoderNumber, amount)
    self.encoderAccumTurnAmountMutex[encoderNumber]:lock()
    local ____self_encoderAccumTurnAmount_0, ____encoderNumber_1 = self.encoderAccumTurnAmount, encoderNumber
    ____self_encoderAccumTurnAmount_0[____encoderNumber_1] = ____self_encoderAccumTurnAmount_0[____encoderNumber_1] + amount
    local newAmount = self.encoderAccumTurnAmount[encoderNumber]
    self.encoderAccumTurnAmountMutex[encoderNumber]:unlock()
    return newAmount
end
function Runtime.prototype.getAndResetEncoderAccumAmount(self, encoderNumber)
    self.encoderAccumTurnAmountMutex[encoderNumber]:lock()
    local amount = self.encoderAccumTurnAmount[encoderNumber]
    self.encoderAccumTurnAmount[encoderNumber] = 0
    self.encoderAccumTurnAmountMutex[encoderNumber]:unlock()
    return amount
end
return ____exports
 end,
["plugins.MidiEncoders.src.PPlugin"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ObjectFactory = require("lib.ObjectFactory")
local ObjectFactory = ____ObjectFactory.ObjectFactory
local ____plugin = require("lib.plugin.index")
local PluginBase = ____plugin.PluginBase
local PluginUtils = ____plugin.PluginUtils
local ____common = require("plugins.MidiEncoders.src.common")
local clearAllRemotes = ____common.clearAllRemotes
local createMidiRemoteNameInstancePrefix = ____common.createMidiRemoteNameInstancePrefix
local ____ContextBuilder = require("plugins.MidiEncoders.src.ContextBuilder")
local ContextBuilder = ____ContextBuilder.ContextBuilder
local ____DataMigrations = require("plugins.MidiEncoders.src.DataMigrations")
local userDataMigrations = ____DataMigrations.userDataMigrations
local ____defaultConfig = require("plugins.MidiEncoders.src.defaultConfig")
local createEmptyUserData = ____defaultConfig.createEmptyUserData
local PLUGIN_ASSETS_MAX_CAPACITY = ____defaultConfig.PLUGIN_ASSETS_MAX_CAPACITY
local ____EventHandler = require("plugins.MidiEncoders.src.EventHandler")
local EventHandler = ____EventHandler.EventHandler
local ____Generator = require("plugins.MidiEncoders.src.Generator")
local Generator = ____Generator.Generator
local ____InstanceCreator = require("plugins.MidiEncoders.src.InstanceCreator")
local InstanceCreator = ____InstanceCreator.InstanceCreator
local ______env = require("plugins.MidiEncoders.src.__env")
local PLUGIN_ENV = ______env.PLUGIN_ENV
local ______imagesB64 = require("plugins.MidiEncoders.src.__imagesB64.index")
local builtInImages = ______imagesB64.images
____exports.PPlugin = __TS__Class()
local PPlugin = ____exports.PPlugin
PPlugin.name = "PPlugin"
__TS__ClassExtends(PPlugin, PluginBase)
function PPlugin.prototype.____constructor(self, pluginInfo, displayHandle, runtime)
    local pu = PluginUtils(nil, PLUGIN_ENV, pluginInfo)
    local contextBuilder = ContextBuilder(nil, pu, displayHandle, runtime)
    PluginBase.prototype.____constructor(self, {
        pluginEnv = PLUGIN_ENV,
        pluginInfo = pluginInfo,
        contextBuilder = contextBuilder,
        builtInImages = builtInImages,
        createDefaultUserData = createEmptyUserData,
        pluginAssetsCapacity = PLUGIN_ASSETS_MAX_CAPACITY,
        displayHandle = displayHandle,
        dataMigrations = userDataMigrations,
        runtime = runtime
    })
    self.userEventHandler = EventHandler(
        nil,
        runtime.log:subLogger("ActionHandler")
    )
end
function PPlugin.prototype.initHooks(self, context)
end
function PPlugin.prototype.createInitialInstanceData(self, instanceConfig)
    return {config = instanceConfig, state = {}}
end
function PPlugin.prototype.createInstance(self, instanceCreateParams)
    self:provisionInstance(
        instanceCreateParams.config,
        function(____, context)
            InstanceCreator:createInstance(context)
        end
    )
end
function PPlugin.prototype.onInstanceDelete(self, context, instanceId)
    for ____, remote in ipairs(__TS__ArrayReverse(context.of:HMidiRemotes():getRemotes())) do
        if remote.name == createMidiRemoteNameInstancePrefix(nil, instanceId) then
            remote:unlock()
            remote:delete()
        end
    end
end
function PPlugin.prototype.updateInstanceConfig(self, instanceId, config)
    self:handleInstanceEvent(
        "Update Config",
        instanceId,
        function(____, context)
            local ____context_0 = context
            local undo = ____context_0.undo
            context.userDataWrapper:setInstanceConfig(instanceId, config)
            self:cleanMIDIRemotes(undo)
            Generator(nil, context):updateMidiRemotes()
            self:getRuntime():getOrCreateInstanceRuntime(instanceId):setConfig(config)
        end
    )
end
function PPlugin.prototype.onInstall(self, context, oldPluginId)
    local ____context_1 = context
    local log = ____context_1.log
    local userDataWrapper = ____context_1.userDataWrapper
    local numOfInstances = userDataWrapper:getNumOfInstances()
    log:trace("onInstall(): numOfInstances=" .. tostring(numOfInstances))
    if numOfInstances > 0 then
        __TS__ArrayForEach(
            userDataWrapper:getInstanceIds(),
            function(____, instanceId)
                context.instanceManager:loadUserInstance(instanceId, context.pluginData.userData.instances[instanceId])
                InstanceCreator:createInstance(context:buildInstanceContext(instanceId))
            end
        )
    end
end
function PPlugin.prototype.onUninstall(self, pluginData, undo, displayHandle, subPoolRegistryData, log)
    self:cleanMIDIRemotes(undo)
end
function PPlugin.prototype.cleanMIDIRemotes(self, undo)
    clearAllRemotes(
        nil,
        __TS__New(ObjectFactory, {undoBlock = undo})
    )
end
return ____exports
 end,
["plugins.MidiEncoders.src.EncoderRotator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____DebugUtils = require("lib.DebugUtils")
local DebugUtils = ____DebugUtils.DebugUtils
local ____Utils = require("lib.Utils")
local series = ____Utils.series
local ____common = require("plugins.MidiEncoders.src.common")
local NUM_OF_ENCODERS = ____common.NUM_OF_ENCODERS
local ____EncoderLocator = require("plugins.MidiEncoders.src.EncoderLocator")
local EncoderLocator = ____EncoderLocator.EncoderLocator
--- The Magical Numbers
-- With Radius 20, and angle step of 0.28 radians.
-- The each step increases the rotation with 1%.
-- Which equals to the actual console encoders in Coarse resolution, per one encoder click.
local TOUCH_ROTATE_RADIUS = 20
local TOUCH_ROTATE_ANGULAR_STEP_RADIANS = 0.28
local MAX_ANGLE = 3.05433
function ____exports.EncoderRotator(self, plugin, log)
    local rotate, rotateAccumulatedAmount, getAllAccumAmounts, rotateAllEncoders, rotateEncoder, touchRotate, amountMode
    function rotate(self, encoderNumber, amount)
        local newAmount = plugin:getRuntime():addToEncoderAccumAmount(encoderNumber, amount)
        log:trace((("Encoder " .. tostring(encoderNumber)) .. ": Added to amount: newAmount = ") .. tostring(newAmount))
        rotateAccumulatedAmount(nil)
    end
    function rotateAccumulatedAmount(self)
        local runtime = plugin:getRuntime()
        local touchMutex = runtime:getEncoderTouchMutex()
        if touchMutex:tryLock() then
            do
                local function ____catch(err)
                    log:error("ERROR: " .. tostring(err))
                end
                local ____try, ____hasReturned = pcall(function()
                    local quit = false
                    repeat
                        do
                            local ____getAllAccumAmounts_result_0 = getAllAccumAmounts(nil, runtime)
                            local encoderAmounts = ____getAllAccumAmounts_result_0.encoderAmounts
                            local nonZeroAmountsExist = ____getAllAccumAmounts_result_0.nonZeroAmountsExist
                            if nonZeroAmountsExist then
                                rotateAllEncoders(nil, encoderAmounts)
                            else
                                quit = true
                            end
                        end
                    until quit
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
                do
                    touchMutex:unlock()
                end
            end
        else
            log:trace("Could not get touch lock")
        end
    end
    function getAllAccumAmounts(self, runtime)
        local nonZeroAmountsExist = false
        local encoderAmounts = __TS__ArrayMap(
            series(nil, 1, NUM_OF_ENCODERS),
            function(____, encoderNumber)
                local amount = runtime:getAndResetEncoderAccumAmount(encoderNumber)
                if math.abs(amount) > 0 then
                    nonZeroAmountsExist = true
                end
                return amount
            end
        )
        return {encoderAmounts = encoderAmounts, nonZeroAmountsExist = nonZeroAmountsExist}
    end
    function rotateAllEncoders(self, encoderAmounts)
        local rotateDone = false
        __TS__ArrayForEach(
            encoderAmounts,
            function(____, amount, encoderIndex)
                if math.abs(amount) > 0 then
                    local encoderNumber = encoderIndex + 1
                    rotateEncoder(nil, encoderNumber, amountMode == "linear" and amount or (amount > 0 and amount * amount or -(amount * amount)))
                    rotateDone = true
                end
            end
        )
        return rotateDone
    end
    function rotateEncoder(self, encoderNumber, amount)
        local wheelCenter = EncoderLocator(nil, log):getEncoderWheelCenter(encoderNumber)
        if wheelCenter ~= nil then
            touchRotate(nil, wheelCenter, amount, encoderNumber)
        end
    end
    function touchRotate(self, center, amount, encoderNumber)
        local touchId = encoderNumber
        local radius = 20
        local screenNumber = 1
        local function polarPos1(self, angle)
            return {
                x = center.x + math.cos(angle) * TOUCH_ROTATE_RADIUS,
                y = center.y + math.sin(angle) * radius
            }
        end
        local function doTouch(self, action, pos)
            log:trace(((((((tostring(touchId) .. "-") .. action) .. ": [") .. tostring(pos.x)) .. ",") .. tostring(pos.y)) .. "]")
            Touch(
                screenNumber,
                action,
                touchId,
                pos.x,
                pos.y
            )
        end
        local angle = amount > 0 and math.min(amount * TOUCH_ROTATE_ANGULAR_STEP_RADIANS, MAX_ANGLE) or math.max(amount * TOUCH_ROTATE_ANGULAR_STEP_RADIANS, -MAX_ANGLE)
        log:trace((((("ROTATE: amount=" .. tostring(amount)) .. ", radius=") .. tostring(radius)) .. ", angle=") .. tostring(angle * 180))
        doTouch(nil, "press", center)
        doTouch(
            nil,
            "move",
            polarPos1(nil, 0)
        )
        doTouch(
            nil,
            "move",
            polarPos1(nil, angle)
        )
        doTouch(
            nil,
            "release",
            polarPos1(nil, angle)
        )
    end
    amountMode = "linear"
    return {rotate = rotate}
end
return ____exports
 end,
["plugins.MidiEncoders.src.ExternalActionHandler"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____common = require("plugins.MidiEncoders.src.common")
local NUM_OF_ENCODERS = ____common.NUM_OF_ENCODERS
local ____EncoderLocator = require("plugins.MidiEncoders.src.EncoderLocator")
local EncoderLocator = ____EncoderLocator.EncoderLocator
local ____EncoderRotator = require("plugins.MidiEncoders.src.EncoderRotator")
local EncoderRotator = ____EncoderRotator.EncoderRotator
local ____RelativeMidiMap = require("plugins.MidiEncoders.src.RelativeMidiMap")
local RELATIVE_MIDI_MODES = ____RelativeMidiMap.RELATIVE_MIDI_MODES
local ____TempGlobalVariableFactory = require("plugins.MidiEncoders.src.TempGlobalVariableFactory")
local TempGlobalVariableFactory = ____TempGlobalVariableFactory.TempGlobalVariableFactory
local GlobalVariable = _G
local CLICK_TOUCH_IF_OFFSET = NUM_OF_ENCODERS
____exports.ExternalActionHandler = function(____, plugin, log)
    local getEncoderAmount, tempGlobalVariableFactory
    function getEncoderAmount(self, instanceId, encoderNumber)
        local midiValue = GlobalVariable[tempGlobalVariableFactory:encoder(encoderNumber, instanceId)]
        if midiValue == nil then
            error(log:msg("midiValue is undefined encoderNumber=" .. tostring(encoderNumber)))
        end
        local instanceRuntime = plugin:getRuntime():getOrCreateInstanceRuntime(instanceId)
        local config = instanceRuntime:getConfig()
        if config == nil then
            config = plugin:handleInstanceEventReadOnly(
                "GetConfig",
                instanceId,
                function(____, context) return context.instanceDataWrapper:getConfig() end
            )
            instanceRuntime:setConfig(config)
        end
        local relativeMidiMaps = RELATIVE_MIDI_MODES[config.midiRelativeMode]
        local amount = relativeMidiMaps.midiValueToAmount[midiValue]
        if amount == nil then
            error(log:msg((("amount is undefined encoderNumber=" .. tostring(encoderNumber)) .. ", mode=") .. config.midiRelativeMode))
        end
        if config.rotateDirection == "inverted" then
            amount = -amount
        end
        return amount
    end
    tempGlobalVariableFactory = TempGlobalVariableFactory(nil, plugin.pu.pluginId)
    local function modifyEncoderNumber(self, instanceId, rawEncoderNumber)
        local invertedEncoders = plugin:getRuntime():getOrCreateInstanceRuntime(instanceId):getInnerOuterInvertion()
        return invertedEncoders == "normal" and rawEncoderNumber or rawEncoderNumber + 5
    end
    return {handle = function(self, action)
        repeat
            local ____switch5 = action.type
            local ____cond5 = ____switch5 == "encoderRotateAction"
            if ____cond5 then
                do
                    local ____action_params_0 = action.params
                    local instanceId = ____action_params_0.instanceId
                    local rawEncoderNumber = ____action_params_0.encoderNumber
                    local amount = getEncoderAmount(nil, instanceId, rawEncoderNumber)
                    local encoderNumber = modifyEncoderNumber(nil, instanceId, rawEncoderNumber)
                    EncoderRotator(nil, plugin, log):rotate(encoderNumber, amount)
                    break
                end
            end
            ____cond5 = ____cond5 or ____switch5 == "encoderRotateWithAmountAction"
            if ____cond5 then
                do
                    local ____action_params_1 = action.params
                    local encoderNumber = ____action_params_1.encoderNumber
                    local amount = ____action_params_1.amount
                    EncoderRotator(nil, plugin, log):rotate(encoderNumber, amount)
                    break
                end
            end
            ____cond5 = ____cond5 or ____switch5 == "encoderClickAction"
            if ____cond5 then
                do
                    local ____action_params_2 = action.params
                    local instanceId = ____action_params_2.instanceId
                    local rawEncoderNumber = ____action_params_2.encoderNumber
                    local encoderNumber = modifyEncoderNumber(nil, instanceId, rawEncoderNumber)
                    local locator = EncoderLocator(nil, log)
                    local screenNumber = locator:getEncodersDisplayNumber()
                    local touchId = encoderNumber + CLICK_TOUCH_IF_OFFSET
                    local encoderPlaceCenter = locator:getEncoderPlaceCenter(encoderNumber)
                    if encoderPlaceCenter ~= nil then
                        local touchMutex = plugin:getRuntime():getEncoderTouchMutex()
                        touchMutex:lock()
                        log:trace(((((tostring(touchId) .. "-press&release}: [") .. tostring(encoderPlaceCenter.x)) .. ",") .. tostring(encoderPlaceCenter.y)) .. "]")
                        Touch(
                            screenNumber,
                            "press",
                            touchId,
                            encoderPlaceCenter.x,
                            encoderPlaceCenter.y
                        )
                        Touch(
                            screenNumber,
                            "release",
                            touchId,
                            encoderPlaceCenter.x,
                            encoderPlaceCenter.y
                        )
                        touchMutex:unlock()
                    end
                    break
                end
            end
            ____cond5 = ____cond5 or ____switch5 == "setInnerOuterInvertion"
            if ____cond5 then
                do
                    local ____action_params_3 = action.params
                    local instanceId = ____action_params_3.instanceId
                    local state = ____action_params_3.state
                    assert(
                        state ~= nil,
                        log:msg("setInnerOuterInvertion action: state is undefined")
                    )
                    log:trace("setInnerOuterInvertion: " .. state)
                    plugin:getRuntime():getOrCreateInstanceRuntime(instanceId):setInnerOuterInvertion(state)
                    break
                end
            end
            do
                error("Unsupported external plugin action type: " .. tostring(action.type))
            end
        until true
    end}
end
return ____exports
 end,
["plugins.MidiEncoders.src.__pluginId"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.PLUGIN_ID = "pro_plugins__plugin_template__v0_1_0"
return ____exports
 end,
["lib.ui.dialogs.PluginToubleshootingDialogV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____Logger = require("lib.Logger")
local LogLevel = ____Logger.LogLevel
local ____dialogs = require("lib.ui.dialogs.index")
local ActionDialogV2 = ____dialogs.ActionDialogV2
local ____Utils = require("lib.Utils")
local typed = ____Utils.typed
function ____exports.PluginTroubleshootingDialogV2(self, plugin)
    return __TS__New(
        ActionDialogV2,
        plugin,
        {
            id = "plugin_troubleshooting",
            width = 800,
            title = "ToubleShooting",
            message = "Contact:\n        \nhepi@ma3-pro-plugins.com\n       \nYou can try setting the Log Level to\n\nDEBUG or TRACE to get more info.\n\n_\n",
            messageWidth = "60%",
            body = function(____, ui) return ui:HInputFieldGrid({
                labelColumnSize = {sizePolicy = "Fixed", size = 150},
                valueColumnSize = {sizePolicy = "Stretch", size = 1},
                rowSize = {sizePolicy = "Fixed", size = 50},
                data = {logLevel = plugin:getLogLevel()},
                inputFields = {typed(
                    nil,
                    {
                        id = "logLevel",
                        fieldType = "selection",
                        label = "Log Level",
                        items = {
                            {id = LogLevel.TRACE, label = "TRACE"},
                            {id = LogLevel.DEBUG, label = "DEBUG"},
                            {id = LogLevel.INFO, label = "INFO"},
                            {id = LogLevel.WARN, label = "WARN"},
                            {id = LogLevel.ERROR, label = "ERROR"}
                        },
                        onChange = function(____, itemId)
                            plugin:setLogLevel(itemId)
                        end
                    }
                )}
            }) end,
            actions = {
                id = "actions",
                direction = "Horizontal",
                actions = {{
                    label = "Close",
                    action = function()
                        plugin:dialogAction({type = "PopDialog"})
                    end
                }}
            }
        }
    )
end
return ____exports
 end,
["lib.ui.dialogs.PluginAboutDialogV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ActionDialogV2 = require("lib.ui.dialogs.ActionDialogV2")
local ActionDialogV2 = ____ActionDialogV2.ActionDialogV2
local ____PluginToubleshootingDialogV2 = require("lib.ui.dialogs.PluginToubleshootingDialogV2")
local PluginTroubleshootingDialogV2 = ____PluginToubleshootingDialogV2.PluginTroubleshootingDialogV2
function ____exports.PluginAboutDialogV2(self, plugin)
    local ____plugin_pu_pluginEnv_0 = plugin.pu.pluginEnv
    local pluginName = ____plugin_pu_pluginEnv_0.pluginName
    local pluginVersion = ____plugin_pu_pluginEnv_0.pluginVersion
    local env = ____plugin_pu_pluginEnv_0.env
    local pluginId = ____plugin_pu_pluginEnv_0.pluginId
    return __TS__New(
        ActionDialogV2,
        plugin,
        {
            id = plugin.pu.pluginId .. "_about",
            width = 600,
            title = "About",
            message = ((("\n" .. pluginName) .. "\n            \nDeveloped by: MA3 Pro Plugins\n            \nwww.ma3-pro-plugins.com\n            \nVersion: ") .. pluginVersion .. (env == "dev" and "_DEV" or "")) .. "\n            ",
            actions = {
                id = "actions",
                direction = "Horizontal",
                actions = {
                    {
                        label = "Troubleshooting",
                        action = function()
                            plugin:dialogAction({
                                type = "PushDialog",
                                dialog = PluginTroubleshootingDialogV2(nil, plugin)
                            })
                        end
                    },
                    {
                        label = "Back",
                        action = function()
                            plugin:dialogAction({type = "PopDialog"})
                        end
                    }
                }
            }
        }
    )
end
return ____exports
 end,
["lib.ui.dialogs.PluginMainDialogSingleInstance"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____dialogs = require("lib.ui.dialogs.index")
local UninstallDialogV2 = ____dialogs.UninstallDialogV2
local ____PluginAboutDialogV2 = require("lib.ui.dialogs.PluginAboutDialogV2")
local PluginAboutDialogV2 = ____PluginAboutDialogV2.PluginAboutDialogV2
local ____UserDialogBase = require("lib.ui.dialogs.UserDialogBase")
local UserDialogBase = ____UserDialogBase.UserDialogBase
____exports.PluginMainDialogSingleInstance = __TS__Class()
local PluginMainDialogSingleInstance = ____exports.PluginMainDialogSingleInstance
PluginMainDialogSingleInstance.name = "PluginMainDialogSingleInstance"
__TS__ClassExtends(PluginMainDialogSingleInstance, UserDialogBase)
function PluginMainDialogSingleInstance.prototype.____constructor(self, params)
    self.params = params
    local ____params_0 = params
    local plugin = ____params_0.plugin
    UserDialogBase.prototype.____constructor(self, params.plugin, {id = plugin.pu.pluginId .. "_main", title = plugin.pu.pluginEnv.pluginName})
end
function PluginMainDialogSingleInstance.prototype.getContent(self)
    local ____self_params_1 = self.params
    local plugin = ____self_params_1.plugin
    local getActions = ____self_params_1.getActions
    local onInstallClicked = ____self_params_1.onInstallClicked
    local log = plugin:getRuntime().log
    log:trace("PluginMainDialogSingleInstance.show()")
    local ____plugin_pu_pluginEnv_2 = plugin.pu.pluginEnv
    local pluginName = ____plugin_pu_pluginEnv_2.pluginName
    local isInstalled = plugin:isInstalled()
    local instanceIds = plugin:getInstanceIds()
    local actions = {}
    if #instanceIds == 0 then
        actions[#actions + 1] = {
            label = "Install",
            action = function()
                onInstallClicked(nil)
            end
        }
    end
    if isInstalled and instanceIds ~= nil and #instanceIds == 1 then
        for ____, action in ipairs(getActions(nil, instanceIds[1])) do
            actions[#actions + 1] = action
        end
    end
    if isInstalled then
        actions[#actions + 1] = {
            label = "Uninstall",
            action = function()
                if plugin.pu.pluginEnv.env == "dev" then
                    plugin:uninstall(self.plugin.displayHandle)
                    plugin:dialogAction({type = "RefreshDialog"})
                else
                    plugin:dialogAction({
                        type = "ReplaceDialog",
                        dialog = UninstallDialogV2(nil, plugin)
                    })
                end
            end
        }
    end
    actions[#actions + 1] = {
        label = "About",
        action = function()
            plugin:dialogAction({
                type = "PushDialog",
                dialog = PluginAboutDialogV2(nil, plugin)
            })
        end
    }
    local grid = self.ui:HActionList({
        id = "selectPluginOptions",
        actions = actions,
        direction = "Vertical",
        actionHeight = 100,
        textAlignmentH = "Center"
    })
    return grid
end
return ____exports
 end,
["plugins.MidiEncoders.src.ui.ConfigurationHelpDialogs"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____dialogs = require("lib.ui.dialogs.index")
local AlertDialogV2 = ____dialogs.AlertDialogV2
function ____exports.RELATIVE_MODE_HELP_DIALOG(self, plugin)
    return __TS__New(AlertDialogV2, plugin, {
        id = "relativeModeHelp",
        title = "Relative Mode Help",
        font = "console20",
        align = "Left",
        width = 800,
        message = "\nStandard MIDI Relative modes:                             \n\n\n                      MIDI  | Relative | MIDI  | Relative \n\n                      Value | Amount   | Value | Amount   \n\n                      ------+----------+-------+----------\n\nMode 1 - (2's comp):  1     | 1        | 127   | -1       \n\n                      2     | 2        | 126   | -2       \n\n                      ------+----------+-------+----------\n\nMode 2 - (Offset):    65    | 1        | 63    | -1       \n\n                      66    | 2        | 62    | -2       \n\n                      ------+----------+-------+----------\n\nMode 3 - (SignBit):   1     | 1        | 65    | -1       \n\n                      2     | 2        | 66    | -2       \n\n"
    })
end
function ____exports.FLIP_INNER_OUTER_HELP_DIALOG(self, plugin)
    return __TS__New(AlertDialogV2, plugin, {
        id = "flipInnerOuterHelp",
        title = "Flip Inner/Outer Help",
        font = "console20",
        align = "Left",
        width = 800,
        message = "\nFlips the encoders 1-5 (Inner encoder) to controll\n\nencoders 6-10 (Outer encoders).\n\n\n\nEncoders 5 and 10 are the ScreenEncoders which scroll X and Y in the selected window.\n\n\n\nThe outer encoders (6-9) are mainly in use in 3D view setup,\n\nLayoutView setup, Timecode view, etc...\n\n"
    })
end
return ____exports
 end,
["plugins.MidiEncoders.src.ui.CreateOrConfigureMidiEncodersDialogV3"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____ui = require("lib.ui.index")
local UIColors = ____ui.UIColors
local ____components = require("lib.ui.components.index")
local DEFAULT_DIVIDER_WIDTH = ____components.DEFAULT_DIVIDER_WIDTH
local HELP_ICON_WIDTH = ____components.HELP_ICON_WIDTH
local TableDivider = ____components.TableDivider
local ____dialogs = require("lib.ui.dialogs.index")
local UserDialogBase = ____dialogs.UserDialogBase
local ____Utils = require("lib.Utils")
local objectKeys = ____Utils.objectKeys
local objectValues = ____Utils.objectValues
local series = ____Utils.series
local typed = ____Utils.typed
local ____defaultConfig = require("plugins.MidiEncoders.src.defaultConfig")
local createDefaultConfig = ____defaultConfig.createDefaultConfig
local ____ConfigurationHelpDialogs = require("plugins.MidiEncoders.src.ui.ConfigurationHelpDialogs")
local FLIP_INNER_OUTER_HELP_DIALOG = ____ConfigurationHelpDialogs.FLIP_INNER_OUTER_HELP_DIALOG
local RELATIVE_MODE_HELP_DIALOG = ____ConfigurationHelpDialogs.RELATIVE_MODE_HELP_DIALOG
local ROW_HEIGHT = 50
local FIELD_LABEL_WIDTH = 280
local FIELD_LABEL_TEXT_ALIGN = "Left"
local DIVIDER_COLOR = UIColors.FrameColor
____exports.ALL_MIDI_RELATIVE_MODES = {{id = "Mode1-2comp", label = "Mode 1 : Two`s Complement"}, {id = "Mode2-offset", label = "Mode 2 : Binary Offset"}, {id = "Mode3-SignBit", label = "Mode 3 : Singed Magnitude"}}
____exports.CreateOrConfigureMidiEncodersDialogV3 = __TS__Class()
local CreateOrConfigureMidiEncodersDialogV3 = ____exports.CreateOrConfigureMidiEncodersDialogV3
CreateOrConfigureMidiEncodersDialogV3.name = "CreateOrConfigureMidiEncodersDialogV3"
__TS__ClassExtends(CreateOrConfigureMidiEncodersDialogV3, UserDialogBase)
function CreateOrConfigureMidiEncodersDialogV3.prototype.____constructor(self, plugin, options)
    UserDialogBase.prototype.____constructor(self, plugin, {id = "configure_midi_ecndoers", title = "MIDI Encoders Configuration", width = 600})
    self.plugin = plugin
    self.options = options
    self.channelInputBoxes = {}
end
function CreateOrConfigureMidiEncodersDialogV3.prototype.getContent(self)
    local plugin = self.plugin
    local options = self.options
    local log = plugin:getRuntime().log
    log:trace("CreateOrConfigureMidiEncodersDialogV3.show()")
    local ____temp_0 = self:getInitialConfig()
    local config = ____temp_0.instanceConfig
    local userDataFromOldVersion = ____temp_0.userDataFromOldVersion
    local function submit(____, caller)
        if options.type == "create" then
            local ____plugin_4 = plugin
            local ____plugin_install_5 = plugin.install
            local ____self_plugin_displayHandle_3 = self.plugin.displayHandle
            local ____userDataFromOldVersion_userData_1 = userDataFromOldVersion
            if ____userDataFromOldVersion_userData_1 ~= nil then
                ____userDataFromOldVersion_userData_1 = ____userDataFromOldVersion_userData_1.userData
            end
            ____plugin_install_5(____plugin_4, ____self_plugin_displayHandle_3, ____userDataFromOldVersion_userData_1)
            if userDataFromOldVersion == nil then
                plugin:createInstance({config = config, createOptions = {}})
            end
        else
            plugin:updateInstanceConfig(options.instanceId, config)
        end
        plugin:dialogAction({type = "PopDialog"})
    end
    local midiInDeviceGrid = self:createMidiInDeviceGrid()
    local inputFieldsGrid = self:createInputFieldsGrid(config)
    local midiMappingTableGrid = self:createMidiMappingGrid(config)
    local formActionsGrid = self.ui:HHorizontalGrid({children = {
        {
            comp = self.ui:UIButton({id = "submit", label = options.type == "create" and "Install" or "Update", signals = {clicked = submit}}),
            item = {sizePolicy = "Stretch", size = 1}
        },
        {
            comp = self.ui:UIButton({
                id = "cancel",
                label = "Cancel",
                signals = {clicked = function()
                    self.plugin:dialogAction({type = "PopDialog"})
                end}
            }),
            item = {sizePolicy = "Stretch", size = 1}
        }
    }})
    local divider = self.ui:UIText({backColor = DIVIDER_COLOR})
    local ____self_7 = self.ui
    local ____self_7_HVerticalGrid_8 = ____self_7.HVerticalGrid
    local ____array_6 = __TS__SparseArrayNew(__TS__Spread(options.type == "create" and userDataFromOldVersion ~= nil and ({{
        comp = self.ui:UIText({text = "Loaded configuration from version " .. userDataFromOldVersion.oldVersion, backColor = UIColors.LabelBG}),
        item = {sizePolicy = "Fixed", size = ROW_HEIGHT}
    }}) or ({})))
    __TS__SparseArrayPush(
        ____array_6,
        {comp = midiInDeviceGrid, item = {sizePolicy = "Content"}},
        {comp = inputFieldsGrid, item = {sizePolicy = "Content"}},
        {comp = divider, item = {sizePolicy = "Fixed", size = DEFAULT_DIVIDER_WIDTH}},
        {comp = midiMappingTableGrid, item = {sizePolicy = "Content"}},
        {comp = formActionsGrid, item = {sizePolicy = "Fixed", size = 100}}
    )
    local formGrid = ____self_7_HVerticalGrid_8(
        ____self_7,
        {children = {__TS__SparseArraySpread(____array_6)}}
    )
    return formGrid
end
function CreateOrConfigureMidiEncodersDialogV3.prototype.createMidiInDeviceGrid(self)
    local uiFactory = self.ui
    local deviceName = Root().StationSettings.LocalSettings.OnPCMidiInDeviceName
    local function openOnpcSettings()
        self:close()
        Timer(
            function()
                CmdIndirect("Menu OnpcSettings")
            end,
            0.5,
            1
        )
    end
    local midiDeviceRow = uiFactory:HHorizontalGrid({children = {
        {
            comp = uiFactory:UIText({text = "MIDI In Device", backColor = UIColors.BackgroundSelectedInverted, textAlignmentH = FIELD_LABEL_TEXT_ALIGN}),
            item = {sizePolicy = "Fixed", size = FIELD_LABEL_WIDTH}
        },
        {
            comp = uiFactory:UIButton({
                id = "midiDeviceIn",
                label = deviceName,
                signals = {clicked = function()
                    openOnpcSettings(nil)
                end}
            }),
            item = {sizePolicy = "Stretch", size = 1}
        }
    }})
    local midiViaWingEnabled = Root().StationSettings.LocalSettings.onPCMidiFromWing
    local midiViaWingRow = uiFactory:HHorizontalGrid({children = {
        {
            comp = uiFactory:UIText({text = "MIDI Via Wing", backColor = UIColors.BackgroundSelectedInverted, textAlignmentH = FIELD_LABEL_TEXT_ALIGN}),
            item = {sizePolicy = "Fixed", size = FIELD_LABEL_WIDTH}
        },
        {
            comp = uiFactory:UIButton({
                id = "midiViaWing",
                label = midiViaWingEnabled and "Yes" or "No",
                props = {textColor = midiViaWingEnabled and UIColors.AlertText or UIColors.Text},
                signals = {clicked = function()
                    openOnpcSettings(nil)
                end}
            }),
            item = {sizePolicy = "Stretch", size = 1}
        }
    }})
    return self.ui:HVerticalGrid({children = {{comp = midiDeviceRow, item = {sizePolicy = "Fixed", size = ROW_HEIGHT}}, {comp = midiViaWingRow, item = {sizePolicy = "Fixed", size = ROW_HEIGHT}}}})
end
function CreateOrConfigureMidiEncodersDialogV3.prototype.createInputFieldsGrid(self, config)
    return self.ui:HInputFieldGrid({
        rowSize = {sizePolicy = "Fixed", size = ROW_HEIGHT},
        labelColumnSize = {sizePolicy = "Fixed", size = FIELD_LABEL_WIDTH},
        valueColumnSize = {sizePolicy = "Stretch", size = 1},
        data = config,
        textAlignmentH = FIELD_LABEL_TEXT_ALIGN,
        inputFields = {
            {
                fieldType = "selection",
                id = "midiRelativeMode",
                label = "Relative Mode",
                items = {{id = "Mode1-2comp", label = "Mode1 2`Comp"}, {id = "Mode2-offset", label = "Mode2 Offset"}, {id = "Mode3-SignBit", label = "Mode3 SignBit"}},
                helpAction = function()
                    self.plugin:dialogAction({
                        type = "PushDialog",
                        dialog = RELATIVE_MODE_HELP_DIALOG(nil, self.plugin)
                    })
                end
            },
            {fieldType = "boolean", id = "enabled", label = "MIDI Remotes", stateLabels = {trueState = "Enabled", falseState = "Disabled"}},
            {fieldType = "selection", id = "rotateDirection", label = "Rotate Direction", items = {{id = "inverted", label = "Inverted"}, {id = "normal", label = "Normal"}}},
            {
                fieldType = "input",
                id = "defaultMidiChannel",
                label = "Set All MIDI Channels",
                type = "POSITIVE_NUMBER",
                range = {min = 1, max = 16},
                onChange = function(____, value)
                    config.defaultMidiChannel = value
                    __TS__ArrayForEach(
                        objectKeys(nil, config.midiMappings),
                        function(____, key)
                            local ____table_channelInputBoxes_index_setText_result_9 = self.channelInputBoxes[key]
                            if ____table_channelInputBoxes_index_setText_result_9 ~= nil then
                                ____table_channelInputBoxes_index_setText_result_9 = ____table_channelInputBoxes_index_setText_result_9:setText(tostring(value))
                            end
                            local configEntry = config.midiMappings[key]
                            configEntry.midiChannel = value
                        end
                    )
                end
            }
        }
    })
end
function CreateOrConfigureMidiEncodersDialogV3.prototype.createMidiMappingGrid(self, config)
    local createMappingRow, uiFactory
    function createMappingRow(self, params)
        local ____params_15 = params
        local id = ____params_15.id
        local label = ____params_15.label
        local channelInputBoxes = ____params_15.channelInputBoxes
        local helpAction = ____params_15.helpAction
        local mapping = config.midiMappings[id]
        local channelInputBox = uiFactory:UIInputBox({
            id = id .. "_channel",
            label = label .. " MIDI Channel",
            props = {showKeyboardButton = "No"},
            type = "POSITIVE_NUMBER",
            range = {min = 1, max = 16},
            value = mapping.midiChannel,
            onChange = function(____, value)
                mapping.midiChannel = value
            end
        })
        channelInputBoxes[id] = channelInputBox
        return {
            uiFactory:HHorizontalGrid({children = {
                {
                    comp = uiFactory:HToggle({
                        id = id .. "_enabled",
                        initialState = mapping.enabled,
                        label = {type = "icon", onIcon = "CheckboxChecked", offIcon = "CheckboxUnchecked"},
                        onChange = function(____, state)
                            Echo((("Update config " .. id) .. ", state=") .. tostring(state))
                            mapping.enabled = state
                        end
                    }),
                    item = {sizePolicy = "Fixed", size = 50}
                },
                {
                    comp = uiFactory:UIText({
                        text = label,
                        backColor = UIColors.LabelBG,
                        textColor = UIColors.Text,
                        alignmentH = FIELD_LABEL_TEXT_ALIGN,
                        textAlignmentH = FIELD_LABEL_TEXT_ALIGN
                    }),
                    item = {sizePolicy = "Stretch", size = 1}
                },
                table.unpack(helpAction == nil and ({}) or ({typed(
                    nil,
                    {
                        comp = uiFactory:UIButton({
                            id = id .. "_help",
                            label = "",
                            icon = "QuestionMarkIcon",
                            props = {backColor = UIColors.BackgroundSelectedInverted, w = HELP_ICON_WIDTH, h = HELP_ICON_WIDTH},
                            signals = {clicked = function()
                                helpAction(nil)
                            end}
                        }),
                        item = {sizePolicy = "Fixed", size = HELP_ICON_WIDTH}
                    }
                )}))
            }}),
            uiFactory:UIText({text = mapping.midiType, backColor = UIColors.BackgroundSelected}),
            channelInputBox,
            uiFactory:UIInputBox({
                id = id .. "_index",
                label = label .. " MIDI Index",
                props = {showKeyboardButton = "No", alignmentH = "Center"},
                type = "POSITIVE_NUMBER",
                range = {min = 0, max = 127},
                value = mapping.midiIndex,
                onChange = function(____, value)
                    config.midiMappings[id].midiIndex = value
                end
            })
        }
    end
    uiFactory = self.ui
    local ____uiFactory_HTableGrid_14 = uiFactory.HTableGrid
    local ____temp_12 = {{label = "Function", item = {sizePolicy = "Fixed", size = FIELD_LABEL_WIDTH}}, {label = "Type", item = {sizePolicy = "Fixed", size = 100}}, {label = "Channel", item = {sizePolicy = "Fixed", size = 100}}, {label = "Index", item = {sizePolicy = "Fixed", size = 100}}}
    local ____temp_13 = {sizePolicy = "Fixed", size = ROW_HEIGHT}
    local ____array_11 = __TS__SparseArrayNew(table.unpack(__TS__ArrayMap(
        series(nil, 1, 5),
        function(____, encoderNumber)
            return createMappingRow(
                nil,
                {
                    id = ("encoder" .. tostring(encoderNumber)) .. "Rotate",
                    label = ("Encoder " .. tostring(encoderNumber)) .. " Rotate",
                    channelInputBoxes = self.channelInputBoxes
                }
            )
        end
    )))
    __TS__SparseArrayPush(
        ____array_11,
        TableDivider(nil),
        table.unpack(__TS__ArrayMap(
            series(nil, 1, 5),
            function(____, encoderNumber)
                return createMappingRow(
                    nil,
                    {
                        id = ("encoder" .. tostring(encoderNumber)) .. "Click",
                        label = ("Encoder " .. tostring(encoderNumber)) .. " Click",
                        channelInputBoxes = self.channelInputBoxes
                    }
                )
            end
        ))
    )
    __TS__SparseArrayPush(
        ____array_11,
        TableDivider(nil),
        createMappingRow(
            nil,
            {
                id = "toggleInnerOuterIndex",
                label = "Flip Inner/Outer",
                channelInputBoxes = self.channelInputBoxes,
                helpAction = function()
                    self.plugin:dialogAction({
                        type = "PushDialog",
                        dialog = FLIP_INNER_OUTER_HELP_DIALOG(nil, self.plugin)
                    })
                end
            }
        ),
        TableDivider(nil)
    )
    return ____uiFactory_HTableGrid_14(
        uiFactory,
        {
            columns = ____temp_12,
            rowSize = ____temp_13,
            rows = {__TS__SparseArraySpread(____array_11)}
        }
    )
end
function CreateOrConfigureMidiEncodersDialogV3.prototype.getInitialConfig(self)
    local options = self.options
    if options.type == "configure" then
        return self.plugin:handlePluginEventReadOnly(
            "Get Instance Config",
            function(____, context)
                local c = context.pluginData.userData.instances[options.instanceId].config
                local midiMappingsClone = __TS__ArrayReduce(
                    objectKeys(nil, c.midiMappings),
                    function(____, prev, key)
                        local m = c.midiMappings[key]
                        local enabled = m.enabled
                        local midiChannel = m.midiChannel
                        local midiType = m.midiType
                        local midiIndex = m.midiIndex
                        prev[key] = {enabled = enabled, midiChannel = midiChannel, midiType = midiType, midiIndex = midiIndex}
                        return prev
                    end,
                    {}
                )
                local clone = {
                    maxAmount = c.maxAmount,
                    defaultMidiChannel = c.defaultMidiChannel,
                    midiRelativeMode = c.midiRelativeMode,
                    midiMappings = midiMappingsClone,
                    enabled = c.enabled,
                    rotateDirection = c.rotateDirection
                }
                return {instanceConfig = clone}
            end
        )
    else
        local oldUserData = self.plugin:getMigratedOldUserData()
        if oldUserData == nil then
            return {instanceConfig = createDefaultConfig(nil)}
        else
            return {
                userDataFromOldVersion = oldUserData,
                instanceConfig = objectValues(nil, oldUserData.userData.instances)[1].config
            }
        end
    end
end
return ____exports
 end,
["plugins.MidiEncoders.src.ui.MainDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____PluginMainDialogSingleInstance = require("lib.ui.dialogs.PluginMainDialogSingleInstance")
local PluginMainDialogSingleInstance = ____PluginMainDialogSingleInstance.PluginMainDialogSingleInstance
local ____CreateOrConfigureMidiEncodersDialogV3 = require("plugins.MidiEncoders.src.ui.CreateOrConfigureMidiEncodersDialogV3")
local CreateOrConfigureMidiEncodersDialogV3 = ____CreateOrConfigureMidiEncodersDialogV3.CreateOrConfigureMidiEncodersDialogV3
function ____exports.MainDialog(self, plugin, instanceId)
    local log = plugin:getRuntime().log
    local isInstalled = plugin:isInstalled()
    local instanceIds
    if isInstalled then
        instanceIds = plugin:handlePluginEventReadOnly(
            "Get Instance",
            function(____, context)
                return context:getInstanceIds()
            end
        )
    end
    local function getActions(____, instanceId)
        return {{
            label = "Configure",
            action = function()
                plugin:dialogAction({
                    type = "PushDialog",
                    dialog = __TS__New(CreateOrConfigureMidiEncodersDialogV3, plugin, {type = "configure", instanceId = instanceId})
                })
            end
        }}
    end
    return __TS__New(
        PluginMainDialogSingleInstance,
        {
            plugin = plugin,
            getActions = getActions,
            onInstallClicked = function()
                plugin:dialogAction({
                    type = "PushDialog",
                    dialog = __TS__New(CreateOrConfigureMidiEncodersDialogV3, plugin, {type = "create"})
                })
            end
        }
    )
end
return ____exports
 end,
["plugins.MidiEncoders.src.main"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____plugin = require("lib.plugin.index")
local getOrCreateRuntime = ____plugin.getOrCreateRuntime
local ____PluginInfo = require("lib.PluginInfo")
local PluginInfo = ____PluginInfo.PluginInfo
local ____PluginsRegistry = require("lib.plugins.PluginsRegistry.PluginsRegistry")
local PluginsRegistry = ____PluginsRegistry.PluginsRegistry
local ____ExternalActionHandler = require("plugins.MidiEncoders.src.ExternalActionHandler")
local ExternalActionHandler = ____ExternalActionHandler.ExternalActionHandler
local ____PPlugin = require("plugins.MidiEncoders.src.PPlugin")
local PPlugin = ____PPlugin.PPlugin
local ____Runtime = require("plugins.MidiEncoders.src.Runtime")
local Runtime = ____Runtime.Runtime
local ____MainDialog = require("plugins.MidiEncoders.src.ui.MainDialog")
local MainDialog = ____MainDialog.MainDialog
local ______env = require("plugins.MidiEncoders.src.__env")
local PLUGIN_ENV = ______env.PLUGIN_ENV
local pluginInfo = PluginInfo(nil, ...)
PluginsRegistry:getOrCreate():register(PLUGIN_ENV, pluginInfo)
local function main(displayHandle, argument)
    local pluginId = PLUGIN_ENV.pluginId
    local runtime = getOrCreateRuntime(
        nil,
        pluginId,
        pluginInfo,
        function()
            return __TS__New(Runtime, pluginId, pluginInfo)
        end
    )
    __TS__New(PPlugin, pluginInfo, displayHandle, runtime):handleMain({userDialogV2 = true, argument = argument, MainDialog = MainDialog, ExternalActionHandler = ExternalActionHandler})
end
return main
 end,
["plugins.MidiEncoders.src.ui.ConfigureHelpDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____dialogs = require("lib.ui.dialogs.index")
local AlertDialog = ____dialogs.AlertDialog
function ____exports.ConfigureHelpDialog(self)
    return AlertDialog(nil, {title = "Configuration Help", message = "\nMode1-2comp: \n\nMode2-offset:\n\nMode3-SignBit:\n\n"})
end
return ____exports
 end,
["plugins.MidiEncoders.src.ui.CreateOrConfigureMidiEncodersDialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
 end,
["plugins.MidiEncoders.src.ui.CreateOrConfigureMidiEncodersDialogV2"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
 end,
}
local __TS__SourceMapTraceBack = require("lualib_bundle").__TS__SourceMapTraceBack
return require("plugins.MidiEncoders.src.main", ...)