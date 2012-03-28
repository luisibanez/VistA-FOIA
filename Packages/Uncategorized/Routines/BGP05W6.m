BGP05W6 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"63304-0523-10 ")
 ;;1953
 ;;21,"63304-0524-01 ")
 ;;1954
 ;;21,"63304-0524-10 ")
 ;;1955
 ;;21,"63304-0525-01 ")
 ;;1956
 ;;21,"63304-0525-10 ")
 ;;1957
 ;;21,"63304-0531-01 ")
 ;;1958
 ;;21,"63304-0532-01 ")
 ;;1959
 ;;21,"63304-0532-10 ")
 ;;1960
 ;;21,"63304-0533-01 ")
 ;;1961
 ;;21,"63304-0533-10 ")
 ;;1962
 ;;21,"63304-0534-01 ")
 ;;1963
 ;;21,"63304-0534-10 ")
 ;;1964
 ;;21,"63304-0535-01 ")
 ;;1965
 ;;21,"63304-0535-10 ")
 ;;1966
 ;;21,"63304-0536-01 ")
 ;;1967
 ;;21,"63304-0536-05 ")
 ;;1968
 ;;21,"63304-0537-01 ")
 ;;1969
 ;;21,"63304-0537-05 ")
 ;;1970
 ;;21,"63304-0538-01 ")
 ;;1971
 ;;21,"63304-0538-05 ")
 ;;1972
 ;;21,"63304-0548-90 ")
 ;;1973
 ;;21,"63304-0549-90 ")
 ;;1974
 ;;21,"63304-0550-90 ")
 ;;1975
 ;;21,"63304-0551-90 ")
 ;;1976
 ;;21,"63304-0599-01 ")
 ;;1977
 ;;21,"63304-0736-00 ")
 ;;1978
 ;;21,"63304-0736-01 ")
 ;;1979
 ;;21,"63304-0736-05 ")
 ;;1980
 ;;21,"63304-0736-90 ")
 ;;1981
 ;;21,"63304-0737-01 ")
 ;;1982
 ;;21,"63304-0737-05 ")
 ;;1983
 ;;21,"63304-0737-90 ")
 ;;1984
 ;;21,"63304-0738-01 ")
 ;;1985
 ;;21,"63304-0738-05 ")
 ;;1986
 ;;21,"63304-0738-90 ")
 ;;1987
 ;;21,"63304-0739-01 ")
 ;;1988
 ;;21,"63304-0739-05 ")
 ;;1989
 ;;21,"63304-0739-90 ")
 ;;1990
 ;;21,"63304-0775-10 ")
 ;;1991
 ;;21,"63304-0775-90 ")
 ;;1992
 ;;21,"63304-0776-10 ")
 ;;1993
 ;;21,"63304-0776-90 ")
 ;;1994
 ;;21,"63304-0777-10 ")
 ;;1995
 ;;21,"63304-0777-90 ")
 ;;1996
 ;;21,"63304-0834-01 ")
 ;;1997
 ;;21,"63304-0834-10 ")
 ;;1998
 ;;21,"63304-0835-01 ")
 ;;1999
 ;;21,"63304-0835-10 ")
 ;;2000
 ;;21,"63304-0836-01 ")
 ;;2001
 ;;21,"63304-0836-10 ")
 ;;2002
 ;;21,"63304-0837-01 ")
 ;;2003
 ;;21,"63304-0837-10 ")
 ;;2004
 ;;21,"63629-1240-01 ")
 ;;2005
 ;;21,"63629-1241-01 ")
 ;;2006
 ;;21,"63629-1242-01 ")
 ;;2007
 ;;21,"63629-1454-01 ")
 ;;2008
 ;;21,"63629-1522-01 ")
 ;;2009
 ;;21,"63629-1522-02 ")
 ;;2010
 ;;21,"63629-1522-03 ")
 ;;2011
 ;;21,"63629-1525-01 ")
 ;;2012
 ;;21,"63629-1525-02 ")
 ;;2013
 ;;21,"63629-1525-03 ")
 ;;2014
 ;;21,"63629-1526-01 ")
 ;;2015
 ;;21,"63629-1526-02 ")
 ;;2016
 ;;21,"63629-1679-01 ")
 ;;2017
 ;;21,"63629-1679-02 ")
 ;;2018
 ;;21,"63629-1679-03 ")
 ;;2019
 ;;21,"63629-1809-01 ")
 ;;2020
 ;;21,"63629-2680-01 ")
 ;;2021
 ;;21,"63629-2680-02 ")
 ;;2022
 ;;21,"63629-2688-01 ")
 ;;2023
 ;;21,"63629-2735-01 ")
 ;;2024
 ;;21,"63629-2908-01 ")
 ;;2025
 ;;21,"63629-2908-02 ")
 ;;2026
 ;;21,"63629-2908-03 ")
 ;;2027
 ;;21,"63629-2935-01 ")
 ;;2028
 ;;21,"63739-0042-01 ")
 ;;2029
 ;;21,"63739-0042-03 ")
 ;;2030
 ;;21,"63739-0042-10 ")
 ;;2031
 ;;21,"63739-0042-15 ")
 ;;2032
 ;;21,"63739-0043-01 ")
 ;;2033
 ;;21,"63739-0043-03 ")
 ;;2034
 ;;21,"63739-0043-10 ")
 ;;2035
 ;;21,"63739-0043-15 ")
 ;;2036
 ;;21,"63739-0302-10 ")
 ;;2037
 ;;21,"63739-0302-15 ")
 ;;2038
 ;;21,"63739-0322-05 ")
 ;;2039
 ;;21,"63739-0322-10 ")
 ;;2040
 ;;21,"63739-0322-15 ")
 ;;2041
 ;;21,"63739-0323-10 ")
 ;;2042
 ;;21,"63739-0323-15 ")
 ;;2043
 ;;21,"63739-0348-10 ")
 ;;2044
 ;;21,"63739-0348-15 ")
 ;;2045
 ;;21,"63739-0349-10 ")
 ;;2046
 ;;21,"63739-0349-15 ")
 ;;2047
 ;;21,"63739-0350-10 ")
 ;;2048
 ;;21,"63739-0350-15 ")
 ;;2049
 ;;21,"63874-0058-10 ")
 ;;2050
 ;;21,"63874-0058-15 ")
 ;;2051
 ;;21,"63874-0058-30 ")
 ;;2052
 ;;21,"63874-0058-90 ")
 ;;2053
 ;;21,"63874-0347-01 ")
 ;;2054
 ;;21,"63874-0347-02 ")
 ;;2055
 ;;21,"63874-0347-05 ")
 ;;2056
 ;;21,"63874-0347-20 ")
 ;;2057
 ;;21,"63874-0347-30 ")
 ;;2058
 ;;21,"63874-0347-40 ")
 ;;2059
 ;;21,"63874-0347-42 ")
 ;;2060
 ;;21,"63874-0347-45 ")
 ;;2061
 ;;21,"63874-0347-90 ")
 ;;2062
 ;;21,"63874-0348-01 ")
 ;;2063
 ;;21,"63874-0348-10 ")
 ;;2064
 ;;21,"63874-0348-14 ")
 ;;2065
 ;;21,"63874-0348-20 ")
 ;;2066
 ;;21,"63874-0348-30 ")
 ;;2067
 ;;21,"63874-0348-60 ")
 ;;2068
 ;;21,"63874-0348-90 ")
 ;;2069
 ;;21,"63874-0379-10 ")
 ;;2070
 ;;21,"63874-0379-30 ")
 ;;2071
 ;;21,"63874-0423-01 ")
 ;;2072
 ;;21,"63874-0423-07 ")
 ;;2073
 ;;21,"63874-0423-10 ")
 ;;2074
 ;;21,"63874-0423-14 ")
 ;;2075
 ;;21,"63874-0423-20 ")
 ;;2076
 ;;21,"63874-0423-30 ")
 ;;2077
 ;;21,"63874-0423-60 ")
 ;;2078
 ;;21,"63874-0514-01 ")
 ;;2079
 ;;21,"63874-0514-10 ")
 ;;2080
 ;;21,"63874-0514-14 ")
 ;;2081
 ;;21,"63874-0514-15 ")
 ;;2082
 ;;21,"63874-0514-16 ")
 ;;2083
 ;;21,"63874-0514-20 ")
 ;;2084
 ;;21,"63874-0514-28 ")
 ;;2085
 ;;21,"63874-0514-30 ")
 ;;2086
 ;;21,"63874-0514-60 ")
 ;;2087
 ;;21,"63874-0514-90 ")
 ;;2088
 ;;21,"63874-0522-01 ")
 ;;2089
 ;;21,"63874-0522-15 ")
 ;;2090
 ;;21,"63874-0522-30 ")
 ;;2091
 ;;21,"63874-0522-60 ")
 ;;2092
 ;;21,"63874-0558-01 ")
 ;;2093
 ;;21,"63874-0558-10 ")
 ;;2094
 ;;21,"63874-0558-14 ")
 ;;2095
 ;;21,"63874-0558-16 ")
 ;;2096
 ;;21,"63874-0558-28 ")
 ;;2097
 ;;21,"63874-0558-30 ")
 ;;2098
 ;;21,"63874-0558-60 ")
 ;;2099
 ;;21,"63874-0558-90 ")
 ;;2100
 ;;21,"63874-0581-10 ")
 ;;2101
 ;;21,"63874-0581-30 ")
 ;;2102
 ;;21,"63874-0581-90 ")
 ;;2103
 ;;21,"63874-0655-01 ")
 ;;2104
 ;;21,"63874-0655-10 ")
 ;;2105
 ;;21,"63874-0655-20 ")
 ;;2106
 ;;21,"63874-0655-30 ")
 ;;2107
 ;;21,"63874-0655-60 ")
 ;;2108
 ;;21,"63874-0987-01 ")
 ;;2109
 ;;21,"63874-0987-10 ")
 ;;2110
 ;;21,"63874-0987-14 ")
 ;;2111
 ;;21,"63874-0987-20 ")
 ;;2112
 ;;21,"63874-0987-30 ")
 ;;2113
 ;;21,"63874-0987-60 ")
 ;;2114
 ;;21,"63874-1114-09 ")
 ;;2115
 ;;21,"64455-0140-10 ")
 ;;2116
 ;;21,"64455-0140-30 ")
 ;;2117
 ;;21,"64455-0140-90 ")
 ;;2118
 ;;21,"64455-0141-10 ")
 ;;2119
 ;;21,"64455-0141-30 ")
 ;;2120
 ;;21,"64455-0141-90 ")
 ;;2121
 ;;21,"64455-0142-10 ")
 ;;2122
 ;;21,"64455-0142-30 ")
 ;;2123
 ;;21,"64455-0142-90 ")
 ;;2124
 ;;21,"64455-0143-10 ")
 ;;2125
 ;;21,"64455-0143-30 ")
 ;;2126
 ;;21,"64455-0143-90 ")
 ;;2127
 ;;21,"64455-0145-01 ")
 ;;2128
 ;;21,"64455-0146-01 ")
 ;;2129
 ;;21,"64679-0902-01 ")
 ;;2130
 ;;21,"64679-0902-02 ")
 ;;2131
 ;;21,"64679-0903-01 ")
 ;;2132
 ;;21,"64679-0903-02 ")
 ;;2133
 ;;21,"64679-0904-01 ")
 ;;2134
 ;;21,"64679-0904-02 ")
 ;;2135
 ;;21,"64679-0905-01 ")
 ;;2136
 ;;21,"64679-0923-02 ")
 ;;2137
 ;;21,"64679-0923-03 ")
 ;;2138
 ;;21,"64679-0923-09 ")
 ;;2139
 ;;21,"64679-0924-02 ")
 ;;2140
 ;;21,"64679-0924-03 ")
 ;;2141
 ;;21,"64679-0924-09 ")
 ;;2142
 ;;21,"64679-0925-01 ")
 ;;2143
 ;;21,"64679-0925-02 ")
 ;;2144
 ;;21,"64679-0925-03 ")
 ;;2145
 ;;21,"64679-0925-09 ")
 ;;2146
 ;;21,"64679-0926-02 ")
 ;;2147
 ;;21,"64679-0926-03 ")
 ;;2148
 ;;21,"64679-0926-09 ")
 ;;2149
 ;;21,"64679-0927-01 ")
 ;;2150
 ;;21,"64679-0927-02 ")
 ;;2151
 ;;21,"64679-0927-05 ")
 ;;2152
 ;;21,"64679-0927-09 ")
 ;;2153
 ;;21,"64679-0928-01 ")
 ;;2154
 ;;21,"64679-0928-05 ")
 ;;2155
 ;;21,"64679-0928-06 ")
 ;;2156
 ;;21,"64679-0928-10 ")
 ;;2157
 ;;21,"64679-0929-01 ")
 ;;2158
 ;;21,"64679-0929-05 ")
 ;;2159
 ;;21,"64679-0929-06 ")
 ;;2160
 ;;21,"64679-0929-10 ")
 ;;2161
 ;;21,"64679-0941-01 ")
 ;;2162
 ;;21,"64679-0941-05 ")
 ;;2163
 ;;21,"64679-0941-06 ")
 ;;2164
 ;;21,"64679-0941-10 ")
 ;;2165
 ;;21,"64679-0942-01 ")
 ;;2166
 ;;21,"64679-0942-02 ")
 ;;2167
 ;;21,"64679-0942-05 ")
 ;;2168
 ;;21,"64679-0942-09 ")
 ;;2169
 ;;21,"64679-0953-01 ")
 ;;2170
 ;;21,"64679-0953-02 ")
 ;;2171
 ;;21,"64679-0953-05 ")
 ;;2172
 ;;21,"64679-0953-09 ")
 ;;2173
 ;;21,"65162-0751-10 ")
 ;;2174
 ;;21,"65162-0751-50 ")
 ;;2175
 ;;21,"65162-0752-10 ")
 ;;2176
 ;;21,"65162-0752-50 ")
 ;;2177
 ;;21,"65162-0753-10 ")
 ;;2178
 ;;21,"65162-0753-50 ")
 ;;2179
 ;;21,"65162-0754-10 ")
 ;;2180
 ;;21,"65162-0754-50 ")
 ;;2181
 ;;21,"65862-0037-01 ")
 ;;2182
 ;;21,"65862-0037-05 ")
 ;;2183
 ;;21,"65862-0038-01 ")
 ;;2184
 ;;21,"65862-0038-05 ")
 ;;2185
 ;;21,"65862-0039-01 ")
 ;;2186
 ;;21,"65862-0039-05 ")
 ;;2187
 ;;21,"65862-0040-01 ")
 ;;2188
 ;;21,"65862-0040-05 ")
 ;;2189
 ;;21,"65862-0041-01 ")
 ;;2190
 ;;21,"65862-0042-01 ")
 ;;2191
 ;;21,"65862-0042-05 ")
 ;;2192
 ;;21,"65862-0043-01 ")
 ;;2193
 ;;21,"65862-0043-05 ")
 ;;2194
 ;;21,"65862-0044-01 ")
 ;;2195
 ;;21,"65862-0044-05 ")
 ;;2196
 ;;21,"65862-0045-01 ")
 ;;2197
 ;;21,"65862-0045-05 ")
 ;;2198
 ;;21,"65862-0116-01 ")
 ;;2199
 ;;21,"65862-0117-01 ")
 ;;2200
 ;;21,"65862-0118-01 ")
 ;;2201
 ;;21,"65862-0164-01 ")
 ;;2202
 ;;21,"65862-0165-01 ")
 ;;2203
 ;;21,"65862-0166-01 ")
 ;;2204
 ;;21,"66105-0101-09 ")
 ;;2205
 ;;21,"66105-0102-09 ")
 ;;2206
 ;;21,"66105-0103-09 ")
 ;;2207
 ;;21,"66105-0524-09 ")
 ;;2208
 ;;21,"66105-0546-09 ")
 ;;2209
 ;;21,"66105-0548-03 ")
 ;;2210
 ;;21,"66105-0555-10 ")
 ;;2211
 ;;21,"66267-1009-00 ")
 ;;2212
 ;;21,"66336-0124-30 ")
 ;;2213
 ;;21,"66336-0232-30 ")
 ;;2214
 ;;21,"66336-0366-30 ")
 ;;2215
 ;;21,"66336-0389-30 ")
 ;;2216
 ;;21,"66336-0389-60 ")
 ;;2217
 ;;21,"66336-0391-30 ")
 ;;2218
 ;;21,"66336-0391-60 ")
 ;;2219
 ;;21,"66336-0393-30 ")
 ;;2220
 ;;21,"66336-0393-60 ")
 ;;2221
 ;;21,"66336-0618-60 ")
 ;;2222
 ;;21,"66336-0691-30 ")
 ;;2223
 ;;21,"66336-0741-30 ")
 ;;2224
 ;;21,"66336-0750-60 ")
 ;;2225
 ;;21,"66336-0750-90 ")
 ;;2226
 ;;21,"66336-0773-30 ")
 ;;2227
 ;;21,"66336-0794-60 ")
 ;;2228
 ;;21,"66336-0867-30 ")
 ;;2229
 ;;21,"66336-0946-30 ")
 ;;2230
 ;;21,"66336-0946-60 ")
 ;;2231
 ;;21,"66336-0946-90 ")
 ;;2232
 ;;21,"66336-0972-30 ")
 ;;2233
 ;;21,"66636-0691-30 ")
 ;;2234
 ;;21,"66685-0301-00 ")
 ;;2235
 ;;21,"66685-0301-02 ")
 ;;2236
 ;;21,"66685-0302-00 ")
 ;;2237
 ;;21,"66685-0302-02 ")
 ;;2238
 ;;21,"66685-0303-00 ")
 ;;2239
 ;;21,"66685-0303-02 ")
 ;;2240
 ;;21,"66685-0304-00 ")
 ;;2241
 ;;21,"66685-0304-02 ")
 ;;2242
 ;;21,"66685-0701-01 ")
 ;;2243
 ;;21,"66685-0701-02 ")
 ;;2244
 ;;21,"66685-0702-01 ")
 ;;2245
 ;;21,"66685-0702-02 ")
 ;;2246
 ;;21,"66685-0702-03 ")
 ;;2247
 ;;21,"66685-0703-01 ")
 ;;2248
 ;;21,"66685-0703-02 ")
 ;;2249
 ;;21,"66685-0703-03 ")
 ;;2250
 ;;21,"66685-0704-01 ")
 ;;2251
 ;;21,"66685-0704-02 ")
 ;;2252
 ;;21,"66685-0704-03 ")
 ;;2253
 ;;21,"66685-0705-01 ")
 ;;2254
 ;;21,"66685-0705-02 ")
 ;;2255
 ;;21,"66685-0706-01 ")
 ;;2256
 ;;21,"66685-0706-03 ")
 ;;2257
 ;;21,"66685-0706-04 ")
 ;;2258
 ;;21,"67253-0671-10 ")
 ;;2259
 ;;21,"67253-0672-10 ")
 ;;2260
 ;;21,"67253-0672-11 ")
 ;;2261
 ;;21,"67253-0673-10 ")
 ;;2262
 ;;21,"67253-0673-11 ")
 ;;2263
 ;;21,"67253-0674-10 ")
 ;;2264
 ;;21,"67253-0674-11 ")
 ;;2265
 ;;21,"67801-0340-03 ")
 ;;2266
 ;;21,"67801-0342-03 ")
 ;;2267
 ;;21,"67801-0343-03 ")
 ;;2268
 ;;21,"67801-0441-03 ")
 ;;2269
 ;;21,"68084-0058-01 ")
 ;;2270
 ;;21,"68084-0060-01 ")
 ;;2271
 ;;21,"68084-0061-01 ")
 ;;2272
 ;;21,"68084-0062-01 ")
 ;;2273
 ;;21,"68084-0064-01 ")
 ;;2274
 ;;21,"68084-0266-01 ")
 ;;2275
 ;;21,"68084-0266-11 ")
 ;;2276
 ;;21,"68084-0267-01 ")
 ;;2277
 ;;21,"68084-0267-11 ")
 ;;2278
 ;;21,"68084-0268-01 ")
 ;;2279
 ;;21,"68084-0268-11 ")
 ;;2280
 ;;21,"68084-0294-21 ")
 ;;2281
 ;;21,"68084-0390-01 ")
 ;;2282
 ;;21,"68084-0390-11 ")
 ;;2283
 ;;21,"68084-0391-01 ")
 ;;2284
 ;;21,"68084-0391-11 ")
 ;;2285
 ;;21,"68084-0392-01 ")
 ;;2286
 ;;21,"68084-0392-11 ")
 ;;2287
 ;;21,"68115-0059-00 ")
 ;;2288
 ;;21,"68115-0059-30 ")
 ;;2289
 ;;21,"68115-0059-90 ")
 ;;2290
 ;;21,"68115-0060-30 ")
 ;;2291
 ;;21,"68115-0060-90 ")
 ;;2292
 ;;21,"68115-0127-00 ")
 ;;2293
 ;;21,"68115-0127-15 ")
 ;;2294
 ;;21,"68115-0127-30 ")
 ;;2295
 ;;21,"68115-0127-60 ")
 ;;2296
 ;;21,"68115-0128-00 ")
 ;;2297
 ;;21,"68115-0128-20 ")
 ;;2298
 ;;21,"68115-0128-30 ")
 ;;2299
 ;;21,"68115-0128-60 ")
 ;;2300
 ;;21,"68115-0128-90 ")
 ;;2301
 ;;21,"68115-0129-30 ")
 ;;2302
 ;;21,"68115-0129-60 ")
 ;;2303
 ;;21,"68115-0207-30 ")
 ;;2304
 ;;21,"68115-0207-60 ")
 ;;2305
 ;;21,"68115-0208-30 ")
 ;;2306
 ;;21,"68115-0208-60 ")
 ;;2307
 ;;21,"68115-0208-90 ")
 ;;2308
 ;;21,"68115-0209-30 ")
 ;;2309
 ;;21,"68115-0215-30 ")
 ;;2310
 ;;21,"68115-0216-30 ")
 ;;2311
 ;;21,"68115-0217-30 ")
 ;;2312
 ;;21,"68115-0361-30 ")
 ;;2313
 ;;21,"68115-0362-00 ")
 ;;2314
 ;;21,"68115-0362-60 ")
 ;;2315
 ;;21,"68115-0363-30 ")
 ;;2316
 ;;21,"68115-0378-30 ")
 ;;2317
 ;;21,"68115-0378-60 ")
 ;;2318
 ;;21,"68115-0396-30 ")
 ;;2319
 ;;21,"68115-0425-90 ")
 ;;2320
 ;;21,"68115-0490-60 ")
 ;;2321
 ;;21,"68115-0530-00 ")
 ;;2322
 ;;21,"68115-0530-30 ")
 ;;2323
 ;;21,"68115-0530-60 ")
 ;;2324
 ;;21,"68115-0573-30 ")
 ;;2325
 ;;21,"68115-0597-00 ")
 ;;2326
 ;;21,"68115-0615-00 ")
 ;;2327
 ;;21,"68115-0621-00 ")
 ;;2328
 ;;21,"68115-0650-00 ")
 ;;2329
 ;;21,"68115-0654-00 ")
 ;;2330
 ;;21,"68115-0673-00 ")
 ;;2331
 ;;21,"68115-0673-30 ")
 ;;2332
 ;;21,"68115-0677-00 ")
 ;;2333
 ;;21,"68115-0677-30 ")
 ;;2334
 ;;21,"68115-0778-00 ")
 ;;2335
 ;;21,"68115-0812-00 ")
 ;;2336
 ;;21,"68115-0812-30 ")
 ;;2337
 ;;21,"68115-0812-60 ")
 ;;2338
